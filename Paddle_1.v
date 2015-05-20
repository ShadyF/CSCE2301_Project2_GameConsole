`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:25:19 05/07/2015 
// Design Name: 
// Module Name:    Paddle_1 
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
module Paddle(
    input clk,
    input rst,
    input [1:0] controls,		//0:no motions 1:left 2: right
	 input [6:0] paddle_width,
    output reg [9:0] paddle_x
    );
	 
always @ (negedge clk or posedge rst)
if (rst)
	paddle_x <= 10'd295; // (630-20-20)/2
else if((controls == 2'd1) && (paddle_x - paddle_width > 20))
	paddle_x <= paddle_x - 2'b10;		//1 pixel to the left
else if ((controls == 2'd2) && (paddle_x + paddle_width < 610))
	paddle_x <= paddle_x + 2'b10;
else
	paddle_x <= paddle_x;
	
endmodule
