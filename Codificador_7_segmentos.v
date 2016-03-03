`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Melissa Fonseca Rodr�guez y Johan Arrieta Sol�rzano
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
    input clock,								//CLOCK DIVIDIDO PARA LA VELOCIDAD DEL DISPLAY	
	 //input [7:0] frecuencia,				//PROVIENE DE LA MEMORIA DE FRECUENCIA
	 input [2:0] cod_frecuencia,
	 input control,
	 input [9:0] corriente,					//PROVIENE DEL CONTADOR PROGRESIVO/REGRESIVO 10 BITS
	 output reg [3:0] selec_digito,
	 output [7:0] numero_cod
	 );
	 reg [9:0]var;
	 reg [3:0]unidades;
	 reg [3:0]decenas;
	 reg [3:0]centenas;
	 reg [3:0]millares;
	 reg [7:0]auxiliar;
	 reg [7:0]auxiliar2;
	 reg [3:0]num;
	 reg [7:0]codificacion;
	
	always @(posedge clock)
	begin
	
		if (control)								//Significa frecuencia	
		begin
			assign var=cod_frecuencia;
			memoria(/*entrada*/"Cod_frecuencia", /*salida*/"unidades", /*salida*/"decenas",/**/);
			num=unidades;
			num=decenas;
			num=centenas;
			num=millares;
			
		end
		
		
		
		else                          		//Significa corriente
			begin
			assign var=corriente;
			end
	end
	Memoria_display instancia_memo(
		.CLK(clock),.numero(num), 
		.controles_display(codificacion)
		);	
	assign numero_cod=codificacion;
endmodule


/*
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
	
*/