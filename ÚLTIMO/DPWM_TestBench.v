`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:15:27 03/05/2016
// Design Name:   DPWM
// Module Name:   D:/Documentos/TEC/VII Semestre/LabDigitales/Proyecto 1/DPWM_/DPWM_TestBench.v
// Project Name:  DPWM_
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DPWM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DPWM_TestBench;

	// Inputs
	reg AUMENTO;
	reg DISMINUCION;
	reg RST;
	reg CLOCK_NEXYS;
	reg OPCION;

	// Outputs
	wire [7:0] NUM_CODIF;
	wire [3:0] SEL_DIGITO;
	wire PWM;

	// Instantiate the Unit Under Test (UUT)
	DPWM uut (
		.AUMENTO(AUMENTO), 
		.DISMINUCION(DISMINUCION), 
		.RST(RST), 
		.CLOCK_NEXYS(CLOCK_NEXYS), 
		.OPCION(OPCION), 
		.NUM_CODIF(NUM_CODIF), 
		.SEL_DIGITO(SEL_DIGITO), 
		.PWM(PWM)
	);
	


	initial begin
		// Initialize Inputs
		AUMENTO = 0;
		DISMINUCION = 0;
		RST = 1;
		CLOCK_NEXYS = 0;
		OPCION = 0;
		
		

		// Wait 100 ns for global reset to finish
		#100 RST = 0;
        
		// Add stimulus here
		
		 
			 #260000 AUMENTO=1;
			 #1000 AUMENTO=0;
			 #700000;
			 
			 #260000 AUMENTO=1;
			 #1000 AUMENTO=0;
			 #700000;
			 
			 #260000 AUMENTO=1;
			 #1000 AUMENTO=0;
			 
			 #1 OPCION=!OPCION;
			 #700000;
			 
			 #260000 AUMENTO=1;
			 #1000 AUMENTO=0;
			 #700000;
			 
			 
			 
			 #260000 DISMINUCION=1;
			 #1000 DISMINUCION=0;
			 #700000;
			 
			 #260000 DISMINUCION=1;
			 #1000 DISMINUCION=0;
			 #700000;
			 
			 #260000 DISMINUCION=1;
			 #1000 DISMINUCION=0;
			 #700000;

			
		
		 
	end
	
	always
		begin
			#5
			CLOCK_NEXYS=!CLOCK_NEXYS;
     end

	 
endmodule

