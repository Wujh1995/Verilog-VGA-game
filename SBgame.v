`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:29 05/26/2016 
// Design Name: 
// Module Name:    SBgame 
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
module SBgame(
			input mclk,    
			input rst,
			input to_left,
			input to_right,
			input [3:0] bar_move_speed,
         output HSync,         
         output [2:1] OutBlue,
         output [2:0] OutGreen, 
         output [2:0] OutRed,         
         output VSync,
			output [3:0] seg_select,
			output [6:0] seg_LED
    );

wire lose;

VGA_Dispay u_VGA_Disp(
	.clk(mclk),
	.to_left(to_left),
	.to_right(to_right),
	.bar_move_speed(bar_move_speed),
	.hs(HSync),
	.Blue(OutBlue),
	.Green(OutGreen),
	.Red(OutRed),
	.vs(VSync),
	.lose(lose)
	);
	
seven_seg score_board(
	.clk(mclk),
	.rst(rst),
	.lose(lose),
	.select(seg_select),
	.seg(seg_LED)
	);
	

endmodule
