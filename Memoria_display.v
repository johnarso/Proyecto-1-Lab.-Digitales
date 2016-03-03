`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Melissa Fonseca Rodríguez y Johan Arrieta Solórzano
// 
// Create Date:    00:32:03 03/01/2016 
// Design Name: 	Memoria para el display 7 segmentos
// Module Name:    Memoria_display 
// Project Name:     DPWM
// Target Devices: Nexys 3
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
module Memoria_display(
    input CLK,
	 input [3:0] numero, 
	 input reset,
	 output [7:0] controles_display
	 );
	 
	 reg [7:0] codigo;
	 
	 always @(posedge CLK)
	 begin
		 if (reset)
			codigo<=8'b11111111;
		 else
			case(numero)
				4'b0000: codigo<=8'b10000001;
				4'b0001: codigo<=8'b11001111;
				4'b0010: codigo<=8'b10010010;
				4'b0011: codigo<=8'b10000110;
				4'b0100: codigo<=8'b11001100;
				4'b0101: codigo<=8'b10100100;
				4'b0110: codigo<=8'b10100000;
				4'b0111: codigo<=8'b10001111;
				4'b1000: codigo<=8'b10000000;
				4'b1001: codigo<=8'b10000100;
				default: codigo<=8'b11111111;
			endcase
	 end
	
	assign controles_display=codigo;


endmodule



	 
