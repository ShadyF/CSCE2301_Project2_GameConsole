`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:10 05/14/2015 
// Design Name: 
// Module Name:    Counter 
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
module Counter(
	 input Score,
	 input rst,
    output [3:0] out0,
    output [3:0] out1
    );
	 
moduloNcounter first(.Score_update(Score),.rst(rst), .Q(out0),.EN(1), .N(9));
moduloNcounter second(.Score_update(Score),.rst(rst), .Q(out1),.EN(out0 == 4'd9), .N(9));

endmodule

