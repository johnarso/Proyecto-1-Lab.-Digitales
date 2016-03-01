`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Melissa Fonseca Rodr�guez y Johan Arrieta Sol�rzano
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
			codigo<=3;
		 else
			case(numero)
				4'b0000: codigo<=3;
				4'b0001: codigo<=159;
				4'b0010: codigo<=37;
				4'b0011: codigo<=13;
				4'b0100: codigo<=153;
				4'b0101: codigo<=73;
				4'b0110: codigo<=65;
				4'b0111: codigo<=31;
				4'b1000: codigo<=1;
				4'b1001: codigo<=9;
				default: codigo<=3;
			endcase
	 end
	
	assign controles_display=codigo;


endmodule
