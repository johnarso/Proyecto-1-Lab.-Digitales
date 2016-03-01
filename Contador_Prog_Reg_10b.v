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
	 output [9:0] cant_corriente 	 //indica el número para seleccionar la corriente respectiva
    );
	 reg lola;     					//para los else que no que evitan warnings, NO TIENE IMPORTANCIA
	 reg [9:0] cuenta;
	 initial
	 cuenta=0;
	 
	 always @(posedge boton_aumento)					//cuando hay un flaco positivo porque se presiona el boton para aumentar
		begin
			if (enable==1)     							//Permite que se aumente si el control lo indica
				begin
				cuenta=cuenta+10;
				if (cuenta>1000)
					cuenta=0;
				else
					lola=1;
				end
			else
			lola=1;
		end
		
	always @(posedge boton_disminuye)  				//cuando hay un flaco positivo porque se presiona el boton para disminuir
		begin
			if (enable==1)									//Permite que se disminuya si el control lo indica
				begin
				cuenta=cuenta-10;
				if (cuenta>1000)
					cuenta=1000;
				else
					lola=1;
				end
			else
				lola=1;
		end
		
	assign cant_corriente=cuenta;

endmodule
