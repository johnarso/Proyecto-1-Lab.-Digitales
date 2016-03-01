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
	 output [2:0] numero_frec 	 //indica el número para seleccionar la frecuencia respectiva
    );
	 
	 reg lolo;     					//para los else que no que evitan warnings, NO TIENE IMPORTANCIA
	 reg [2:0] cuenta;
	 initial
	 cuenta=0;
	 
	 always @(posedge boton_aumento)					//cuando hay un flaco positivo porque se presiona el boton para aumentar
		begin
			if (enable==1)     							//Permite que se aumente si el control lo indica
				cuenta=cuenta+1;
			else
				lolo=1;
		end
		
	 always @(posedge boton_disminuye)				//cuando hay un flaco positivo porque se presiona el boton para disminuir
		begin
			if (enable==1)     							//Permite que se aumente si el control lo indica
				cuenta=cuenta-1;
			else
				lolo=1;
		end
				
	assign numero_frec=cuenta;

endmodule
