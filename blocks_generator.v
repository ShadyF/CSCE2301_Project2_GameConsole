`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:32:14 05/12/2015 
// Design Name: 
// Module Name:    blocks_generator 
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
module blocks_generator(
	 input clk,
	 input rst,
	 input [24:0] collision_ball,
	 output [9:0] b1,
	 output [9:0] b2,
	 output [9:0] b3,
	 output [9:0] b4,
	 output [9:0] b5,
	 output [9:0] b6,
	 output [9:0] b7,
	 output [9:0] b8,
	 output [9:0] b9,
	 output [9:0] b10,
	 output [9:0] b11,
	 output [9:0] b12,
	 output [9:0] b13,
	 output [9:0] b14,
	 output [9:0] b15,
	 output [9:0] b16,
	 output [9:0] b17,
	 output [9:0] b18,
	 output [9:0] b19,
	 output [9:0] b20,
	 output [9:0] r1,
	 output [9:0] r2,
	 output [9:0] r3,
	 output [9:0] r4,
	 output [9:0] r5,
	 output [9:0] G1_Y,
	 output [9:0] G2_Y,
	 output [9:0] G3_Y,
	 output [9:0] G4_Y,
	 output [9:0] G5_Y,
	 output [9:0] G6_Y,
	 output [9:0] block_width,
	 output [9:0] rock_width,
	 output [9:0] rock2_width
    );

/*
always @ (posedge clk or posedge rst) begin
	if(rst) begin
		b1 = 0;
		b2 = 0;
		b3 = 0;
		b4 = 0;
		b5 = 0;
		b6 = 0;
		b7 = 0;
		b8 = 0;
		b9 = 0;
		b10 = 0;
		b11 = 0;
		b12 = 0;
		b13 = 0;
		b14 = 0;
		b15 = 0;
		b16 = 0;
		b17 = 0;
		b18 = 0;
		b19 = 0;
		b20 = 0;
		r1 = 0;
		r2 = 0;
		r3 = 0;
		r4 = 0;
		r5 = 0;
		G1_Y = 0;
		G2_Y = 0;
		G3_Y = 0;
		G4_Y = 0;
		G5_Y = 0;
		G6_Y = 0;
		block_width = 0;
		rock_width = 0;
		rock2_width = 0;
		
	end
	else begin*/
assign b1 = (collision_ball[0]) ? 10'd640 : 10'd30;
assign b2 = (collision_ball[1]) ? 10'd640 : 10'd100;
assign b3 = (collision_ball[2]) ? 10'd640 : 10'd30;
assign b4 = (collision_ball[3]) ? 10'd640 : 10'd100;
assign b5 = (collision_ball[4]) ? 10'd640 : 10'd30;
assign b6 = (collision_ball[5]) ? 10'd640 : 10'd100;
assign b7 = (collision_ball[6]) ? 10'd640 : 10'd30;
assign b8 = (collision_ball[7]) ? 10'd640 : 10'd100;
assign b9 = (collision_ball[8]) ? 10'd640 : 10'd220;
assign b10 = (collision_ball[9]) ? 10'd640 : 10'd305;
assign b11 = (collision_ball[10]) ? 10'd640 : 10'd220;
assign b12 = (collision_ball[11]) ? 10'd640 : 10'd305;
assign b13 = (collision_ball[12]) ? 10'd640 : 10'd450;	
assign b14 = (collision_ball[13]) ? 10'd640 : 10'd520;
assign b15 = (collision_ball[14]) ? 10'd640 : 10'd450;
assign b16 = (collision_ball[15]) ? 10'd640 : 10'd520;
assign b17 = (collision_ball[16]) ? 10'd640 : 10'd450;
assign b18 = (collision_ball[17]) ? 10'd640 : 10'd520;
assign b19 = (collision_ball[18]) ? 10'd640 : 10'd450;
assign b20 = (collision_ball[19]) ? 10'd640 : 10'd520;
assign r1 = (collision_ball[20]) ? 10'd640 : 10'd170;
assign r2 = (collision_ball[21]) ? 10'd640 : 10'd400;
assign r3 = (collision_ball[22]) ? 10'd640 : 10'd220;
assign r4 = (collision_ball[23]) ? 10'd640 : 10'd170;
assign r5 = (collision_ball[24]) ? 10'd640 : 10'd400;
assign G1_Y = 10'd40;
assign G2_Y = 10'd100;
assign G3_Y = 10'd130;
assign G4_Y = 10'd180;
assign G5_Y = 10'd230;
assign G6_Y = 10'd290;
assign block_width = 10'd60;
assign rock_width = 10'd30;
assign rock2_width = 10'd170;

endmodule

/*
assign b1 = (collision_ball[0]) ? 10'd640 : 10'd30;
assign b2 = (collision_ball[1]) ? 10'd640 : 10'd145;
assign b3 = (collision_ball[2]) ? 10'd640 : 10'd260;
assign b4 = (collision_ball[3]) ? 10'd640 : 10'd375;
assign b5 = (collision_ball[4]) ? 10'd640 : 10'd490;
assign G1_Y = 10'd30;
assign b6 = (collision_ball[5]) ? 10'd640 : 10'd145;
assign b7 = (collision_ball[6]) ? 10'd640 : 10'd260;
assign b8 = (collision_ball[7]) ? 10'd640 : 10'd375;
assign G2_Y = 10'd60;
*/
/*
always @ (collision_ball[0])
	counter[0] = counter[0] ^ 1;
always @ (collision_ball[1])
	counter[1] = counter[1] ^ 1;
always @ (collision_ball[2])
	counter[2] = counter[2] ^ 1;
always @ (collision_ball[3])
	counter[3] = counter[3] ^ 1;
always @ (collision_ball[4])
	counter[4] = counter[4] ^ 1;
always @ (collision_ball[5])
	counter[5] = counter[5] ^ 1;
always @ (collision_ball[6])
	counter[6] = counter[6] ^ 1;
always @ (collision_ball[7])
	counter[7] = counter[7] ^ 1;
*/
/*
always @ (negedge clk) begin
	b1 <= 10'd30;
	b2 <= 10'd145;
	b3 <= 10'd260;
	b4 <= 10'd375;
	b5 <= 10'd490;
	G1_Y <= 10'd30;
	b6 <= 10'd145;
	b7 <= 10'd260;
	b8 <= 10'd375;
	G2_Y <= 10'd60;
end*/

