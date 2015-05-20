`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:41 05/07/2015 
// Design Name: 
// Module Name:    Sync_Controller 
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
module Sync_Controller(
    input clk,
    input rst,
    output vga_out_hsync,
    output vga_out_vsync,
    output [9:0] X_Pixel,
    output [9:0] Y_Pixel,
	 output active
    );

localparam HActive = 10'd630;
localparam HBack = 10'd48;		//48
localparam HFront = 10'd16;
localparam HSync = 10'd96;		//96
localparam VActive = 10'd480;
localparam VBack = 10'd31;
localparam VFront = 10'd11;
localparam VSync = 10'd2;		//2

reg [9:0] Count_X;
reg [9:0] Count_Y;
wire H_MAX = (Count_X == (HActive + HBack + HFront + HSync - 1'b1) );
wire V_MAX = (Count_Y == (VActive + VBack + VFront + VSync - 1'b1) );

always @ (posedge clk or posedge rst)	begin
	if (rst)
		Count_X <= 10'b0; 
	else if (H_MAX)
		Count_X <= 10'b0;
	else
		Count_X <= Count_X + 1'b1;
end

always @ (posedge clk or posedge rst) begin
	if (rst)
		Count_Y <= 10'b0;
	else if (V_MAX && H_MAX)
		Count_Y <= 10'b0;
	else if (H_MAX)
		Count_Y <= Count_Y + 1'b1;
	else
		Count_Y <= Count_Y; 
end
/*
reg VGA_H, VGA_V;
always @ (posedge clk) begin
VGA_H <= (Count_X < HActive + HFront + HSync && Count_X >= HActive + HFront);		//when VGA_H is low
VGA_V <= (Count_Y <= (VActive + VFront + VSync) && Count_Y >= (VActive + VFront) );	//when VGA_H is high
end
*/
assign vga_out_hsync = ~(Count_X < HActive + HFront + HSync && Count_X >= HActive + HFront);
assign vga_out_vsync = ~(Count_Y <= (VActive + VFront + VSync) && Count_Y >= (VActive + VFront) );

assign X_Pixel = Count_X;
assign Y_Pixel = Count_Y;

wire ActiveH = (Count_X < HActive);
wire ActiveV = (Count_Y < VActive);
assign active = ActiveH && ActiveV;

endmodule
