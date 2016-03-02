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
output [10:0] numdiv
 );
 reg [10:0]ndiv;
   always @(posedge clock)
      if (reset)
         ndiv <= 11'b11010000011;
      else
         case (num)
            8'b00011110 : ndiv <= 11'b11010000011;
            8'b00110010 : ndiv <= 11'b01111101000;
            8'b01001011 : ndiv <= 11'b01010011011;
            8'b01100100 : ndiv <= 11'b00111110100;
            8'b01111101 : ndiv <= 11'b00110010000;
            8'b10010110 : ndiv <= 11'b00101001101;
            8'b10101111 : ndiv <= 11'b00100011110;
            8'b11001000 : ndiv <= 11'b00011111010;
            default     : ndiv <= 11'b11010000011;
         endcase
assign numdiv=ndiv;
endmodule
