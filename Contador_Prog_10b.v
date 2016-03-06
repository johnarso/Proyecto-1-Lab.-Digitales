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
		input reset,
		output [9:0] cuenta					
    );
	 reg [9:0] contador;
	 
	 always @(posedge CLK)					//cuenta siempre en los flancos de reloj
		begin
		if (reset) 
			contador<=1'b0;
		else if (contador==10'd1000)
			contador <=1'b0;
		else 
			contador<=contador+7'd50;
		end

	assign cuenta=contador;

endmodule
