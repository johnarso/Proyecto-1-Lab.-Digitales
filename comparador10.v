`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Johan Arrieta Solórzano
// 
// Create Date:    22:26:59 02/29/2016 
// Design Name: 
// Module Name:    comparador10 
// Project Name: Proyecto 1
// Target Devices: Nexys 3
// Tool versions: 
// Description: Este modulo compara 2 numeros binarios de 10 bits
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module comparador10(
    input wire [9:0] n1,
    input wire [9:0] n2,
	 input wire clk,
	 input reset,
    output reg pwm
    );
	initial pwm=1'b0;
	always @(posedge clk)
		if(reset)
			pwm<=1'b0;
		else
			if (n2<=n1)
				pwm<=1'b1;
			else pwm<=1'b0;

endmodule
