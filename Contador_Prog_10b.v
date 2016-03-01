`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Melissa Fonseca Rodríguez
// 
// Create Date:    22:59:21 02/29/2016 
// Design Name:    Contador Progresivo de 10 bits
// Module Name:    Contador_Prog_10b 
// Project Name:    DPWM
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
module Contador_Prog_10b(
		input CLK,								//reloj con la frecuencia que el usuario ha seleccionado
		output [9:0] cuenta					
    );
	 reg [9:0] contador;
	 reg lolos;									//para los else que no que evitan warnings, NO TIENE IMPORTANCIA
	 
	 initial
	 contador=0;
	 
	 always @(posedge CLK)					//cuenta siempre en los flancos de reloj
		begin
			contador=contador+10;
			if (contador>1000)
				contador=0;
			else
				lolos=1;
		end
	
	assign cuenta=contador;


endmodule
