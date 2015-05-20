`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:20:11 05/13/2015 
// Design Name: 
// Module Name:    paddle_clk 
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
module paddle_clock(
    input clk,
    input rst,
    output out_clk
    );
//100Hz
reg [31:0] counter;
always @ (negedge clk or posedge rst)
if (rst)
	counter <= 32'd0;
else if (counter == 32'd350000)
	counter <= 32'd0;
else
	counter <= counter + 1;
	
assign out_clk = (counter == 32'd350000);

endmodule