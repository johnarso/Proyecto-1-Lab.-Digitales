`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:10:42 03/07/2016 
// Design Name: 
// Module Name:    Div_2 
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
module Divisor_f(
    input clk,
	 input reset,
    input [7:0] frecnum,
    output reg clkdiv,
	 output reg clk_display
	 );
	 
	 reg [6:0] ndiv;
	 reg [6:0] cont_f;
	 reg [13:0] cont_d;
	 
	 always @(posedge clk)
	 begin
	 
		 if (reset)
		 begin
			clkdiv=0;
			clk_display=0;
			ndiv=7'd0;
			cont_f=7'd0;
			cont_d=14'd0;
		 end
		 
		 else
		 begin
			case (frecnum)
            8'd30 : ndiv = 7'b1010011;
            8'd50 : ndiv = 7'b0110010;
            8'd75 : ndiv = 7'b0100001;
            8'd100 : ndiv = 7'b0011001;
            8'd125 : ndiv = 7'b0010100;
            8'd150 : ndiv = 7'b0010001;
            8'd175 : ndiv = 7'b0001110;
            8'd200 : ndiv = 7'b0001101;
            default : ndiv = 7'b1010011;
         endcase
			
			if (cont_f==(ndiv-7'd1))
			begin
				cont_f=7'd0;
				clkdiv=~clkdiv;
			end
			else cont_f=cont_f+7'd1;
				
			if(cont_d==14'd12499)
			begin
				cont_d=14'd0;
				clk_display=~clk_display;
			end
			else cont_d=cont_d+14'd1;
		 end
		 
	 end

endmodule
