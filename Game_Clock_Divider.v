`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:00:09 05/07/2015 
// Design Name: 
// Module Name:    Game_Clock_Divider 
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
module Game_Clock_Divider(
    input clk,
    input rst,
    output out_clk
    );
//100Hz
reg [31:0] counter;
always @ (negedge clk or posedge rst)
if (rst)
	counter <= 32'd0;
else if (counter == 32'd270000)
	counter <= 32'd0;
else
	counter <= counter + 1;
	
assign out_clk = (counter == 32'd270000);

endmodule
