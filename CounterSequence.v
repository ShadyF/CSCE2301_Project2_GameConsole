`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:23:11 05/14/2015 
// Design Name: 
// Module Name:    CounterSequence 
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
module CounterSequence(
	 input Score_update,
    input rst,
    output reg [3:0] Q,
    input EN,
    input [4:0] N
    );

always @ (posedge Score_update or posedge rst)
begin

if (rst)
	Q <= 0;
	
else if(Q == N & EN)
	Q <= 0;

	
else
	if(EN)
		Q<= Q+1'b1;
	else
		Q <= Q;
end

endmodule