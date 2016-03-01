`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Melissa Fonseca Rodríguez
// 
// Create Date:    23:24:29 02/29/2016 
// Design Name: 	Memoria de frecuencias
// Module Name:    Memoria_frecuencias 
// Project Name:    DPWM
// Target Devices: Nexis 3
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
module Memoria_frecuencias(
	input CLK,
	input [2:0] num_frecuencia,        			//indicador de la frecuencia
   output [7:0] frecuencia
	);

	reg lolo;											//para los else que no que evitan warnings, NO TIENE IMPORTANCIA
	reg [7:0] codigo;
	
	initial codigo=0;
	
	always @(posedge CLK)
	begin
		case(num_frecuencia)
			3'b000: codigo=30;
			3'b001: codigo=50;
			3'b010: codigo=75;
			3'b011: codigo=100;
			3'b100: codigo=125;
			3'b101: codigo=150;
			3'b110: codigo=175;
			3'b111: codigo=200;
		default: lolo=1;
		endcase
	end
	
	assign frecuencia=codigo;
	
endmodule
