`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:40 05/07/2015 
// Design Name: 
// Module Name:    VGA_Display 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module VGA_Display(input clk, input left, input left_2, input rst, input switch, input AI_switch,
						 output [2:0] R, output [2:0] G, output [1:0] B, output vga_out_vsync, output vga_out_hsync,
						 output reg flag, output [6:0] OUT, output[3:0] EN,
						 input MISO, output SS, output MOSI, output SCLK, 
						 input MISO_P2, output SS_P2, output MOSI_P2, output SCLK_P2 ,output test);
	 
wire pixel_clk;
wire game_clk;
wire temp_clk;
wire ball_clk = (switch) ? temp_clk : game_clk;

wire [9:0] X_Pixel;
wire [9:0] Y_Pixel;
wire active;

//Paddle Specs
wire [9:0] paddle_x_P1;		//middle of the paddle
wire [9:0] paddle_x_P2;
parameter [6:0] paddle_width = 7'd60;


//Ball Specs
wire [9:0] ball_x;
wire [9:0] ball_y;
wire [5:0] collision_ball;
wire [4:0] ball_size;
assign ball_size = 5'd20;

wire RightBorder = (X_Pixel >= 610 && X_Pixel <= 630);
wire LeftBorder = (X_Pixel >= 0 && X_Pixel <= 20);
wire TopBorder = (Y_Pixel >= 0 && Y_Pixel <= 20);
wire border_Rico = (RightBorder | LeftBorder | TopBorder);
wire border = (RightBorder | LeftBorder);

wire paddle_P1 = ( (X_Pixel <= paddle_x_P1 + paddle_width) && (X_Pixel >= paddle_x_P1 - paddle_width) ) && (Y_Pixel >= 460 && Y_Pixel < 480);
wire paddle_P2 = ( (X_Pixel <= paddle_x_P2 + paddle_width) && (X_Pixel >= paddle_x_P2 - paddle_width) ) && (Y_Pixel >= 0 && Y_Pixel < 20);
wire paddle_P1_left = (X_Pixel >= paddle_x_P1 - paddle_width && X_Pixel <= paddle_x_P1 - paddle_width + 40);
wire paddle_P1_right = (X_Pixel <= paddle_x_P1 + paddle_width && X_Pixel >= paddle_x_P1 + paddle_width - 40);
wire paddle_P2_left = (X_Pixel >= paddle_x_P2 - paddle_width && X_Pixel <= paddle_x_P2 - paddle_width + 40);
wire paddle_P2_right = (X_Pixel <= paddle_x_P2 + paddle_width && X_Pixel >= paddle_x_P2 + paddle_width - 40);

wire ball = (X_Pixel >= ball_x && X_Pixel <= ball_x + ball_size && Y_Pixel >= ball_y && Y_Pixel <= ball_y + ball_size);
wire ball_reset = (ball_y > 530);


//Block Wires
wire [9:0] b1;
wire [9:0] b2;
wire [9:0] b3;
wire [9:0] b4;
wire [9:0] b5;
wire [9:0] b6;
wire [9:0] b7;
wire [9:0] b8;
wire [9:0] b9;
wire [9:0] b10;
wire [9:0] b11;
wire [9:0] b12;
wire [9:0] b13;
wire [9:0] b14;
wire [9:0] b15;
wire [9:0] b16;
wire [9:0] b17;
wire [9:0] b18;
wire [9:0] b19;
wire [9:0] b20;
wire [9:0] r1;
wire [9:0] r2;
wire [9:0] r3;
wire [9:0] r4;
wire [9:0] r5;
wire [9:0] G1_Y;
wire [9:0] G2_Y;
wire [9:0] G3_Y;
wire [9:0] G4_Y;
wire [9:0] G5_Y;
wire [9:0] G6_Y;
wire [24:0] collision_blocks;
wire [9:0] block_width;
wire [9:0] rock_width;
wire [9:0] rock2_width;

//Shift Ricochet Screen up
wire [9:0] s = 10'd30;
//Block Wiring 
wire Block1 = (X_Pixel >= b1 && X_Pixel <= b1 + block_width && Y_Pixel >= G1_Y + 20 - s && Y_Pixel <= G3_Y - 10 - s); 																										
wire Block2 = (X_Pixel >= b2 && X_Pixel <= b2 + block_width && Y_Pixel >= G1_Y + 20 - s && Y_Pixel <= G3_Y - 10 - s);							
wire Block3 = (X_Pixel >= b3 && X_Pixel <= b3 + block_width && Y_Pixel >= G3_Y - s && Y_Pixel <= G3_Y + 50 - s);																		
wire Block4 = (X_Pixel >= b4 && X_Pixel <= b4 + block_width && Y_Pixel >= G3_Y - s && Y_Pixel <= G3_Y + 50 - s);																
wire Block5 = (X_Pixel >= b5 && X_Pixel <= b5 + block_width && Y_Pixel >= G5_Y - s && Y_Pixel <= G6_Y - 10 - s);
wire Block6 = (X_Pixel >= b6 && X_Pixel <= b6 + block_width && Y_Pixel >= G5_Y - s && Y_Pixel <= G6_Y - 10 - s);
wire Block7 = (X_Pixel >= b7 && X_Pixel <= b7 + block_width && Y_Pixel >= G6_Y - s && Y_Pixel <= G6_Y + 50 - s);
wire Block8 = (X_Pixel >= b8 && X_Pixel <= b8 + block_width && Y_Pixel >= G6_Y - s && Y_Pixel <= G6_Y + 50 - s);														
wire Block9 = (X_Pixel >= b9 && X_Pixel <= b10 - 20 && Y_Pixel >= G1_Y + 20 - s && Y_Pixel <= G3_Y - 10 - s);		
wire Block10 = (X_Pixel >= b10 && X_Pixel <= r2 - 20 && Y_Pixel >= G1_Y + 20 - s && Y_Pixel <= G3_Y - 10 - s);		
wire Block11 = (X_Pixel >= b11 && X_Pixel <= b12 - 20 && Y_Pixel >= G3_Y - s && Y_Pixel <= G3_Y + 50 - s);		
wire Block12 = (X_Pixel >= b12 && X_Pixel <= r2 - 20 && Y_Pixel >= G3_Y - s && Y_Pixel <= G3_Y + 50 - s);		
wire Block13 = (X_Pixel >= b13 && X_Pixel <= b14 - 10 && Y_Pixel >= G1_Y + 20 - s && Y_Pixel <= G3_Y - 10 - s);		
wire Block14 = (X_Pixel >= b14 && X_Pixel <= b14 + 60 && Y_Pixel >= G1_Y + 20 - s && Y_Pixel <= G3_Y - 10 - s);		
wire Block15 = (X_Pixel >= b15 && X_Pixel <= b16 - 10 && Y_Pixel >= G3_Y - s && Y_Pixel <= G3_Y + 50 - s);		
wire Block16 = (X_Pixel >= b16 && X_Pixel <= b16 + 60 && Y_Pixel >= G3_Y - s && Y_Pixel <= G3_Y + 50 - s);		
wire Block17 = (X_Pixel >= b17 && X_Pixel <= b18 - 10 && Y_Pixel >= G5_Y - s && Y_Pixel <= G6_Y - 10 - s);		
wire Block18 = (X_Pixel >= b18 && X_Pixel <= b18 + 60 && Y_Pixel >= G5_Y - s && Y_Pixel <= G6_Y - 10 - s);		
wire Block19 = (X_Pixel >= b19 && X_Pixel <= b20 - 10 && Y_Pixel >= G6_Y - s && Y_Pixel <= G6_Y + 50 - s);		
wire Block20 = (X_Pixel >= b20 && X_Pixel <= b20 + 60&& Y_Pixel >= G6_Y - s && Y_Pixel <= G6_Y + 50 - s);		
wire Rock1 = (X_Pixel >= r1 && X_Pixel <= r1 + rock_width && Y_Pixel >= G1_Y + 20 - s && Y_Pixel <= G3_Y + 50 - s);		
wire Rock2 = (X_Pixel >= r2 && X_Pixel <= r2 + rock_width && Y_Pixel >= G1_Y + 20 - s && Y_Pixel <= G3_Y + 50 - s);		
//wire Rock3 = (X_Pixel >= r3 + 20 && X_Pixel <= r3 + rock2_width - 30 && Y_Pixel >= G4_Y + 20 - s && Y_Pixel <= G4_Y + 30 - s);		
wire Rock4 = (X_Pixel >= r4 && X_Pixel <= r4 + rock_width && Y_Pixel >= G5_Y - s && Y_Pixel <= G5_Y + 110 - s);		
wire Rock5 = (X_Pixel >= r5 && X_Pixel <= r5 + rock_width && Y_Pixel >= G5_Y - s && Y_Pixel <= G5_Y + 110 - s);


//All Rocks --> Rocks
//All Blocks --> Blocks
wire Rocks = (Rock1 || Rock2 || Rock5 || Rock4);
wire Blocks = (Block1 || Block2 || Block3 || Block4 || Block5 || Block6 || Block7 || 
					Block8 || Block9 || Block10 || Block11 || Block12 || Block13 || Block14 ||
					Block15|| Block16 || Block17 || Block18 || Block19 || Block20);																

//ball collision points
wire ball_top = (X_Pixel == ball_x + (ball_size)/2 && Y_Pixel <= ball_y - 8 && Y_Pixel >= ball_y  - 13);
wire ball_bot = (X_Pixel == ball_x + (ball_size)/2 && Y_Pixel >= ball_y + ball_size + 8 && Y_Pixel <= ball_y  + ball_size + 13);
wire ball_right = (X_Pixel >= ball_x + ball_size + 8 && X_Pixel <= ball_x + ball_size + 13 && Y_Pixel == ball_y + (ball_size)/2);
wire ball_left = (X_Pixel <= ball_x - 8 && X_Pixel >= ball_x - 13 && Y_Pixel == ball_y + (ball_size)/2);

//wire ball_top = (X_Pixel == ball_x + (ball_size)/2 && Y_Pixel == ball_y - 2);
//wire ball_bot = (X_Pixel == ball_x + (ball_size)/2 && Y_Pixel == ball_y + ball_size + 2);
//wire ball_right = (X_Pixel == ball_x + ball_size +2 && Y_Pixel == ball_y + (ball_size)/2);
//wire ball_left = (X_Pixel == ball_x - 2 && Y_Pixel == ball_y + (ball_size)/2);

wire ball_top_2 = (X_Pixel == ball_x + (ball_size)/2 && Y_Pixel == ball_y - 5);
wire ball_bot_2 = (X_Pixel == ball_x + (ball_size)/2 && Y_Pixel == ball_y + ball_size + 5);
wire ball_right_2 = (X_Pixel == ball_x + ball_size + 5 && Y_Pixel == ball_y + (ball_size)/2);
wire ball_left_2 = (X_Pixel == ball_x - 5 && Y_Pixel == ball_y + (ball_size)/2);

wire ball_all_2 = (ball_top_2 || ball_left_2 || ball_right_2 || ball_bot_2);
wire ball_all = (ball_top || ball_left || ball_right || ball_bot);
wire ANYTHING = (switch) ?  (paddle_P1 || border_Rico || Rocks) : (paddle_P1 || border || paddle_P2);

wire CLK = clk;
wire RST = rst;

// Holds data to be sent to PmodJSTK
wire [7:0] sndData;
wire [7:0] sndData_P2;

// Signal to send/receive data to/from PmodJSTK
wire sndRec;
wire sndRec_P2;

// Data read from PmodJSTK
wire [39:0] jstkData;
wire [39:0] jstkData_P2;

// Signal carrying output data that user selected
wire [9:0] posData;
wire [9:0] posData_P2;

PmodJSTK PmodJSTK_Int(
					.CLK(CLK),
					.RST(RST),
					.sndRec(sndRec),
					.DIN(sndData),
					.MISO(MISO),
					.SS(SS),
					.SCLK(SCLK),
					.MOSI(MOSI),
					.DOUT(jstkData) );

PmodJSTK PmodJSTK_Int2(
					.CLK(CLK),
					.RST(RST),
					.sndRec(sndRec),
					.DIN(sndData_P2),
					.MISO(MISO_P2),
					.SS(SS_P2),
					.SCLK(SCLK_P2),
					.MOSI(MOSI_P2),
					.DOUT(jstkData_P2) );
			
ClkDiv_5Hz genSndRec(
					.CLK(CLK),
					.RST(RST),
					.CLKOUT(sndRec)
			);
			

// Use state of switch 0 to select output of X position or Y position data to SSD
assign posData = {jstkData[25:24], jstkData[39:32]};
assign posData_P2 = {jstkData_P2[25:24], jstkData_P2[39:32]};

// Data to be sent to PmodJSTK, lower two bits will turn on leds on PmodJSTK
assign sndData = {10'b10000010};
assign sndData_P2 = {10'b10000001};
//Score
assign test = (posData > 480) && (posData < 490);
ScoreCounter SCounter (ball_clk, (ball_y >= 1'b1 && ball_y <= 2), (ball_y >= 480 && ball_y <= 482), rst, OUT, EN);

dividertest pixel_divider (clk, rst, pixel_clk);		//generates pixel_clk
Game_Clock_Divider game_divider (clk, rst, game_clk);	//generates game_clk
paddle_clock ball_p (clk, rst, temp_clk);					//Paddle_clk

Sync_Controller controller(.clk(pixel_clk), .rst(rst), .vga_out_vsync(vga_out_vsync), .vga_out_hsync(vga_out_hsync), .X_Pixel(X_Pixel), .Y_Pixel(Y_Pixel), .active(active));

//Paddles and Controls
wire [1:0] left_P2 = (posData_P2 > 550) ? 2 : (posData_P2 < 400) ? 1 : 0;
wire [1:0] left_ai = (paddle_x_P2 > ball_x && ball_y < 300) ? 1'b1 : (paddle_x_P2 < ball_x && ball_y < 300) ? 2'd2 : 2'd0;
wire [1:0] controls_P1 = (posData > 550) ? 2 : (posData < 400) ? 1 : 0;
wire [1:0] controls_P2 = (AI_switch) ? left_ai : left_P2;

Paddle P1 (game_clk, rst, controls_P1, paddle_width, paddle_x_P1);
Paddle P2 (game_clk, rst, controls_P2, paddle_width, paddle_x_P2);

//Ball
Ball ball_module (ball_clk, rst, ball_x, ball_y, collision_ball);	//ball_clk

//Block Generator
blocks_generator Blocks_Gen (pixel_clk, rst, collision_blocks, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19, b20,
 r1, r2, r3, r4, r5, G1_Y, G2_Y, G3_Y, G4_Y, G5_Y, G6_Y, block_width, rock_width, rock2_width);

//Collision with ball
reg [3:0] CBall;
//wire ANYCOL = (ANYTHING && flag);
always @ (posedge pixel_clk or posedge rst) begin		//what happens here when top border?
	if (rst) begin
		CBall = 4'd7;
		flag = 0;
		end
	else if(game_clk)begin
		CBall = 4'd7;
		flag = 0;
	end
	else if (ANYTHING && ball_top_2 && !flag && !border) begin
		flag = 1;
		if(paddle_P1_left || paddle_P1_right)
			CBall = 4'd2;
		else
			CBall = 4'd1;
		end
	else if (ANYTHING && ball_bot_2 && !flag && !border) begin
		flag = 1;
		if(paddle_P2_left || paddle_P2_right) 
			CBall = 4'd4;
		else
			CBall = 4'd3;
		end
	else if (ANYTHING && ball_left_2 && !flag && !paddle_P1 && !paddle_P2) begin
		CBall = 4'd5;
		flag = 1;
		end
	else if (ANYTHING && ball_right_2 && !flag && !paddle_P1 && !paddle_P2) begin
		CBall = 4'd6;
		flag = 1;
		end
	else if (ball_reset) begin
		CBall = 4'd0;
	end	
end

//Deleting the blocks
reg [24:0] CBlocks;
reg flag_block;
wire detect = (CBall[0] || CBall[1] || CBall[2] || CBall[3]);
always @ (posedge pixel_clk or posedge rst) begin
	if (rst) begin
		CBlocks <= 20'b0;
		flag_block <= 0;
		end
	else if (ball_all_2 && Block1) 
		CBlocks <= CBlocks | (20'd1);

	else if (ball_all_2 && Block2) 
		CBlocks <= CBlocks | (20'd2);

	else if (ball_all_2 && Block3)
		CBlocks <= CBlocks | (20'd4);

	else if (ball_all_2 && Block4) 
		CBlocks <= CBlocks | (20'd8);

	else if (ball_all_2 && Block5) 
		CBlocks <= CBlocks | (20'd16);

	else if (ball_all_2 && Block6) 
		CBlocks <= CBlocks | (20'd32);

	else if (ball_all_2 && Block7) 
		CBlocks <= CBlocks | (20'd64);

	else if (ball_all_2 && Block8) 
		CBlocks <= CBlocks | (20'd128);

	else if (ball_all_2 && Block9) 
		CBlocks <= CBlocks | (20'd256);

	else if (ball_all_2 && Block10) 
		CBlocks <= CBlocks | (20'd512);

	else if (ball_all_2 && Block11) 
		CBlocks <= CBlocks | (1024);

	else if (ball_all_2 && Block12) 
		CBlocks <= CBlocks | (20'd2048);

	else if (ball_all_2 && Block13) 
		CBlocks <= CBlocks | (20'd4096);

	else if (ball_all_2 && Block14) 
		CBlocks <= CBlocks | (20'd8192);

	else if (ball_all_2 && Block15) 
		CBlocks <= CBlocks | (20'd16384);

	else if (ball_all_2 && Block16) 
		CBlocks <= CBlocks | (20'd32768);

	else if (ball_all_2 && Block17) 
		CBlocks <= CBlocks | (20'd65536);

	else if (ball_all_2 && Block18) 
		CBlocks <= CBlocks | (20'd131072);

	else if (ball_all_2 && Block19) 
		CBlocks <= CBlocks | (20'd262144);

	else if (ball_all_2 && Block20) 
		CBlocks <= CBlocks | (20'd524288);

	else if (ball_reset) begin
		CBlocks <= 20'b0;
		flag_block <= 0;
		end
end


wire pong = border || paddle_P1 || paddle_P2 || ball;
wire ricochet = border_Rico || paddle_P1 || ball || Blocks;

wire R_temp = (switch) ? (ricochet ^ border_Rico ^ Blocks) & active : (pong ^ paddle_P1) & active;
wire B_temp = (switch) ? (ricochet ^ Blocks ^ ball ^ Rocks) & active : (pong ^ paddle_P2 ^ ball) & active;
wire G_temp = (switch) ? (ricochet ^ border_Rico ^ ball ^ Rocks) & active : (pong ^ ball) & active;

assign R = (R_temp) ? 3'b111 : 3'b000;
assign G = (G_temp) ? 3'b111 : 3'b000;
assign B = (B_temp) ? 2'b11 : 2'b00;

assign collision_ball = CBall;
assign collision_blocks = CBlocks;

endmodule

