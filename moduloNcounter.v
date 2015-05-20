`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:31 05/14/2015 
// Design Name: 
// Module Name:    moduloNcounter 
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
module moduloNcounter(
	 input Score_update,
    input rst,
    output [3:0] Q,
    input EN,
    input [4:0] N
    );

reg [3:0] Q1;
always @ (negedge Score_update or posedge rst)
begin
if (rst)
	Q1 = 4'b0;
else if( (Q1 == N) & EN)
	Q1 = 4'b0;

	
else if(EN)
		Q1 = Q1+1'b1;
else
		Q1 = Q1;
end
assign Q = Q1;
endmodule