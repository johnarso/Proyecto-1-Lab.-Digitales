`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:18:13 03/02/2016
// Design Name:   Contador_Prog_Reg_3b
// Module Name:   D:/Documentos/TEC/VII Semestre/LabDigitales/Proyecto 1/Basura/DPWM/Contador_3b_TB.v
// Project Name:  DPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Contador_Prog_Reg_3b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Contador_3b_TB;

	// Inputs
	reg boton_aumento;
	reg boton_disminuye;
	reg enable;
	reg reset;

	// Outputs
	wire [2:0] numero_frec;

	// Instantiate the Unit Under Test (UUT)
	Contador_Prog_Reg_3b uut (
		.boton_aumento(boton_aumento), 
		.boton_disminuye(boton_disminuye), 
		.enable(enable), 
		.reset(reset), 
		.numero_frec(numero_frec)
	);

	initial begin
		// Initialize Inputs
		boton_aumento = 0;
		boton_disminuye = 0;
		enable = 0;
		reset = 0;

		// Wait 100 ns for global reset to finish
		
        #10
		  reset=1;
		  #10
		  reset=0;
		// Add stimulus here
		$monitor ("numero_frec= ",numero_frec);
		enable=1;
		#10
		boton_aumento = 1;
		#10
		boton_aumento = 0;
		#10
		enable=0;
		#10
		boton_aumento = 1;
		#10
		enable=1;
		#10
		boton_aumento = 0;
		#10
		boton_aumento = 1;
		#10
		boton_aumento = 0;
		#10
		boton_disminuye = 1;
		#10
		boton_disminuye = 0;
		#10
		boton_disminuye = 1;
		#10
		boton_disminuye = 0;
		#10
		boton_disminuye = 1;
		#10
		boton_disminuye = 0;
	end
		
      
endmodule

