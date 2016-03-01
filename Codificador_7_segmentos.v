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
	 output reg [3:0] selec_digito,
	 output reg [7:0] numero_cod
	 );
	 reg [9:0]var;
	 reg [3:0]unidades;
	 reg [3:0]decenas;
	 reg [3:0]centenas;
	 reg [3:0]millares;
	 reg [7:0]auxiliar;
	 reg [7:0]auxiliar2;
	 reg [3:0]num;
	
	always @(posedge clock)
	begin
	 if (control==1)					//Significa frecuencia
		assign var=frecuencia;
	else                          //Significa corriente
		begin
		assign var=corriente;
		end
		
	selec_digito=0;
	auxiliar<=var/10;
	unidades<=var-(auxiliar*10);
	num=unidades;
   		
	#20	
	selec_digito<=1;
	auxiliar<=var/100;
	auxiliar2<=(var/10);
	decenas<=auxiliar2-(auxiliar*10);
	num=decenas;
	#20
	selec_digito<=2;
	auxiliar<=frecuencia/1000;
	auxiliar2<=(frecuencia/100);
	centenas<=auxiliar2-(auxiliar*10);
	num=centenas;
	#20
	selec_digito<=3;
	auxiliar<=var/1000;
	millares<=auxiliar;
	num=millares;
	end
	Memoria_display(
		.CLK(clock),.numero(num), 
		.controles_display(numero_cod)
		);	
endmodule
