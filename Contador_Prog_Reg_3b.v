`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Melissa Fonseca
// 
// Create Date:    23:40:46 02/28/2016 
// Design Name:   Contador 3 bits
// Module Name:    Contador_Prog_Reg_3b 
// Project Name:    DPWM
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
module Contador_Prog_Reg_3b(
	 input boton_aumento,			 //Para aumentar
	 input boton_disminuye, 		 //Para disminuir
	 input enable,						 //Permite el funcionamiento del bloque
	 input reset,
	 output [2:0] numero_frec 	 //indica el número para seleccionar la frecuencia respectiva
    );
	 reg [2:0] cuenta;
	 always @(posedge boton_aumento or posedge boton_disminuye or posedge reset)
	 begin
		if (reset)										//inicia el valor de cuenta
			cuenta<=0;
		else if (boton_aumento)			//cuando hay un flaco positivo porque se presiona el boton para aumentar
				if (enable) cuenta<=numero_frec+1'b1;
		else if(boton_disminuye)				//cuando hay un flaco positivo porque se presiona el boton para disminuir
				if (enable) cuenta<=numero_frec-1'b1;
	 end
	 assign numero_frec=cuenta;
endmodule
