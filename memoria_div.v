`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:11:11 03/01/2016 
// Design Name: 
// Module Name:    memoria_div 
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
module memoria_div(   
input [7:0] num,
input clock,
input reset,
output [6:0] numdiv
 );
 reg [6:0]ndiv;
   always @(posedge clock)
      if (reset)
         ndiv <= 6'b10001;
      else
         case (num)
            8'b00011110 : ndiv <= 7'b1010011;
            8'b00110010 : ndiv <= 7'b0110010;
            8'b01001011 : ndiv <= 7'b0100001;
            8'b01100100 : ndiv <= 7'b0011001;
            8'b01111101 : ndiv <= 7'b0010100;
            8'b10010110 : ndiv <= 7'b0010001;
            8'b10101111 : ndiv <= 7'b0001110;
            8'b11001000 : ndiv <= 7'b0001101;
            default     : ndiv <= 7'b1010011;
         endcase
assign numdiv=ndiv;
endmodule
