`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:57:15 03/02/2016
// Design Name:   Contador_Prog_10b
// Module Name:   D:/Documentos/TEC/VII Semestre/LabDigitales/Proyecto 1/Basura/DPWM/Contador_Prog_10b_Testbench.v
// Project Name:  DPWM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Contador_Prog_10b
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Contador_Prog_10b_Testbench;

	// Inputs
	reg CLK;
	reg reset;

	// Outputs
	wire [9:0] cuenta;

	// Instantiate the Unit Under Test (UUT)
	Contador_Prog_10b uut (
		.CLK(CLK), 
		.reset(reset), 
		.cuenta(cuenta)
	);

	initial 
	begin
		// Initialize Inputs
CLK=0;
		reset=0;
		#10
		CLK=1;
		reset=1;
		#10
		CLK=0;
		reset=0;

	end
	
	always
	forever 
		begin
		 #333
		 CLK=!CLK;
		end
      
endmodule

