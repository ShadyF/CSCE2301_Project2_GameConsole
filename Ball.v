`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:02:54 05/10/2015 
// Design Name: 
// Module Name:    Ball 
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
module Ball(
    input clk,
    input rst,
    output [9:0] ball_x,
    output [9:0] ball_y,
    input [3:0] collision	// 1: TopMid 2: TopAngle
									// 3: BotMid 4: BotAngle
									// 5: Left	 6: Right	7: no collision 0:reset
    );
	 
reg [9:0] Vx, Vy;
reg [9:0] Bx, By;
always @ (negedge clk or posedge rst)
	if(rst)	begin
		Bx <= 10'd295;
		By <= 10'd240;
		Vx <= 10'd1;
		Vy <= 10'b1111111111;
	end
	else if (collision == 4'd0)	begin
		Bx <= 10'd295;
		By <= 10'd240;
		Vx <= 10'd1;
		Vy <= 10'b1111111111;
	end
		
	else if(collision == 4'd1) begin	//topmid
		Vy <= 10'd2;
		if(Vx == 10'd2 || Vx == 10'd3)
			Vx <= 10'd2;
		else
			Vx <= 10'b1111111110;
	end
	else if (collision == 4'd2) begin//TopAngle
		Vy <= 10'd1;
		if(Vx == 10'd2 || Vx == 10'd3)
			Vx <= 10'd3;
		else
			Vx <= 10'b1111111101;
	end
	else if (collision == 4'd3) begin	//BotMid
		Vy <= 10'b1111111110;
		if(Vx == 10'd2 || Vx == 10'd3)
			Vx <= 10'd2;
		else
			Vx <=10'b1111111110;
	end	
	
	else if (collision == 4'd4) begin	//BotAngle
		Vy <= 10'b1111111111;
		if(Vx == 10'd2 || Vx == 10'd3)
			Vx <=10'd3;
		else
			Vx <= 10'b1111111101;
	end
	
	else if (collision == 4'd5) 	//Left
		if (Vx == 10'b1111111101)
			Vx <= 10'd3;
		else
			Vx <= 10'd2;
	else if (collision == 4'd6)	//Right
		if(Vx == 10'd3)
			Vx <= 10'b1111111101;
		else
			Vx <= 10'b1111111110;
	else if (collision == 4'd7)begin
		Bx <= Bx + Vx;
		By <= By + Vy;
	end
	else begin
		Bx <= Bx;
		By <= By;
	end
	
/*	
always @ (negedge clk or posedge rst)
	if(rst)	begin
		Bx <= 10'd295;
		By <= 10'd240;
		Vx <= 10'd3;
		Vy <= 10'b1111111101;
	end
	else if (collision == 4'd0)	begin
		Bx <= 10'd295;
		By <= 10'd240;
		Vx <= 10'd3;
		Vy <= 10'b1111111101;
	end
		
	else if(collision == 4'd1)	//topmid
		Vy <= 10'd3;					//Vx (5), Vy (5)	
	else if (collision == 4'd2)	//TopAngle
		Vy <= 10'd1;
	else if (collision == 4'd3)	//BotMid
		Vy <= 10'b1111111101;
	else if (collision == 4'd4)	//BotAngle
		Vy <= 10'b1111111101;
	else if( collision == 4'd5) 	//Left
		Vx <= 10'd3;			
	else if (collision == 4'd6)	//Right
		Vx <= 10'b1111111101;		
	else if ( collision == 4'd7)begin
		Bx <= Bx + Vx;
		By <= By + Vy;
	end
	else begin
		Bx <= Bx;
		By <= By;
	end
*/
assign ball_x = Bx;
assign ball_y = By;

endmodule
