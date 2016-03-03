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
	 input [3:0] unidades,
	 input [3:0] decenas,
	 input [3:0] centenas,
	 input [3:0] millares,
	 input reset,
	 output reg [7:0] codigo,
	 output reg [3:0] seleccion
	 );
	 //reg [7:0] codigo;
	 reg RST;
	 reg [3:0] numero;
	 reg i;
	 assign RST=reset;
	 
	 if (RST)
			assign codigo=8'b11111111;
	 else
	 begin
		for (i=1;i<=4;i=i+1)
		begin
			case(i)
				1: assign numero=unidades, 
					seleccion=4'b0001;
				2: assign numero=decenas,
					seleccion=4'b0010;
				3: assign numero=centenas,
					seleccion=4'b0100;
				4: assign numero=millares,
					seleccion=4'b1000;
				default: assign numero=4'b0000;
				endcase
		
			always @(posedge CLK)
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
	 end
	
	//assign controles_display=codigo;


endmodule



	 
