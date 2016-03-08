`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:53:28 03/02/2016
// Design Name:   Contador_Prog_Reg_10b
// Module Name:   D:/Documentos/TEC/VII Semestre/LabDigitales/Proyecto 1/Basura/DPWM/Contador_PR_10b_TB.v
// Project Name:  DPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Contador_Prog_Reg_10b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Contador_PR_10b_TB;

	// Inputs
	reg boton_aumento;
	reg boton_disminuye;
	reg enable;
	reg reset;

	// Outputs
	wire [9:0] cant_corriente;

	// Instantiate the Unit Under Test (UUT)
	Contador_Prog_Reg_10b uut (
		.boton_aumento(boton_aumento), 
		.boton_disminuye(boton_disminuye), 
		.enable(enable), 
		.reset(reset), 
		.cant_corriente(cant_corriente)
	);

	initial begin
		// Initialize Inputs
		boton_aumento = 0;
		boton_disminuye = 0;
		enable = 0;
		reset = 0;
		#10
		reset=1;
		#10
		reset=0;
		#10
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

