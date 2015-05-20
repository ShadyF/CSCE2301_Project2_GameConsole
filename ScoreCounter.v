`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:28 05/14/2015 
// Design Name: 
// Module Name:    ScoreCounter 
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
module ScoreCounter(
    input clk,
	 input Score_P1_update,
	 input Score_P2_update,
    input rst,
    output reg [6:0] OUT,
    output reg [3:0] EN
    );

wire HZ1;
wire HZ100;
wire [3:0] out0, out2;
wire [3:0] out1, out3;
wire [6:0] bcd0, bcd1, bcd2, bcd3;
wire [3:0] sel_MUX; 

//clockdivide2	divider(.clk(clk),.rst(rst),.clkdivided1hz(HZ1), .clkdivided2hz(HZ100));
Counter	P1(.Score(Score_P1_update), .rst(rst), .out0(out0), .out1(out1));
Counter	P2(.Score(Score_P2_update), .rst(rst), .out0(out2), .out1(out3));
BCD7segment		BCD0(out0, bcd0);
BCD7segment		BCD1(out1, bcd1);
BCD7segment		BCD2(out2, bcd2);
BCD7segment		BCD3(out3, bcd3);
CounterSequence cont(.Score_update(clk),.rst(rst), .Q(sel_MUX), .EN(1), .N(3));

always @ (posedge clk)		//binary decoder
begin
	case(sel_MUX)
	
	0: EN = 4'b0111;
	1: EN = 4'b1011;
	2: EN = 4'b1101;
	3: EN = 4'b1110;
	
endcase
end

always @ (posedge clk)		//MUX
begin
	case(sel_MUX)
	
	0: OUT = bcd3;
	1: OUT = bcd2;
	2: OUT = bcd1;
	3: OUT = bcd0;
	endcase
end

endmodule
