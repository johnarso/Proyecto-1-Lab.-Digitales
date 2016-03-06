`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:  TEC
// Engineer: Melissa Fonseca Rodríguez
// 
// Create Date:    21:21:47 02/29/2016 
// Design Name:     Contador progresivo regresivo 10 bits
// Module Name:    Contador_Prog_Reg_10b 
// Project Name:    DPWM
// Target Devices:  Nexis 3
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
module Contador_Prog_Reg_10b(
	 input boton_aumento,			 //Para aumentar
	 input boton_disminuye, 		 //Para disminuir
	 input enable,						 //Permite el funcionamiento del bloque
	 input reset,
	 output [9:0] cant_corriente 	 //indica el número para seleccionar la corriente respectiva
    );
	 
	 reg [9:0] cuenta;
	 
	 always @(posedge boton_aumento or posedge boton_disminuye or posedge reset)
	 begin
		if (reset)										//inicia el valor de cuenta
			cuenta<=10'd500;
		else if (boton_aumento)								//siempre que este habilitado para contar
			if (enable)						//cuando hay un flaco positivo porque se presiona el boton para aumentar
			begin
				if (cuenta==10'd1000)						//condicion debido al limite de corriente
					cuenta<=10'd0;
				else
					cuenta<=cuenta+10'd50;					//cuenta de 10 en 10 amperes ascendentemente
			end
			
		else if (boton_disminuye)				//cuando hay un flaco positivo porque se presiona el boton para disminuir
			if (enable)
			begin
				if (cuenta==0)						//condicion debido al limite de corriente
					cuenta<=10'd1000;
				else
					cuenta<=cuenta-10'd50;					//cuenta de 10 en 10 descendentemente
			end
					
	 end
	 
	assign cant_corriente=cuenta;					//asigna la cuenta a la salida

endmodule
