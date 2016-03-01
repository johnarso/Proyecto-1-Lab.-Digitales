`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Melissa Fonseca Rodríguez y Johan Arrieta Solórzano
// 
// Create Date:    00:12:49 03/01/2016 
// Design Name: 	Codificador para el siete segmentos
// Module Name:    Codificador_7_segmentos 
// Project Name: 		DPWM	
// Target Devices:    Nexys 3
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
module Codificador_7_segmentos(
    input clock,
	 input [7:0] frecuencia,
	 input control,
	 input [9:0] corriente,
	 output [3:0] selec_digito,
	 output [7:0] numero_cod
	 );
	 
	 reg unidades,decenas,centenas;
	 reg auxiliar;
	 
	 if (control==1)					//Significa frecuencia
		begin
			assign auxiliar=frecuencia/10;
			assign unidades=frecuencia-(auxiliar*10);
			Memoria_display(
				.CLK(clock),.numero(unidades), 
				.controles_display(numero_cod));
						
		end
		
	 else									//Significa corriente
		begin
		
		end
	 
	 


endmodule
