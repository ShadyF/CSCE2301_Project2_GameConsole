`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:03:40 05/07/2015 
// Design Name: 
// Module Name:    dividertest 
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
module dividertest(
    input clk,
    input rst,
    output reg pixel_clk
    );
//mod2 divider
always @ (posedge clk)
if (rst)
	pixel_clk <= 1'b0;
else
	pixel_clk <= ~pixel_clk;

endmodule
