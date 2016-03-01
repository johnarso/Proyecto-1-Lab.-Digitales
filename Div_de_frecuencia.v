`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Johan Arrieta Solórzano
// 
// Create Date:    18:32:17 02/29/2016 
// Design Name: Divisor de frecuencia
// Module Name:    Divisor_de_frecuencia 
// Project Name: Proyecto 1
// Target Devices: Nexys 3
// Tool versions: 
// Description: Este modulo divide la frecuencia del reloj de la Nexys segun la frecuencia de salida que se desee en el PWM 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Divisor_de_frecuencia(
    input wire clk,reset,
    input wire [7:0] frecnum,
    output reg clkdiv
    );
	reg [9:0]q;
	always @(posedge clk, posedge reset)
	if (reset)
		begin
			q<=10'd0;
			clkdiv<=0;
		end
	else
		if (q==((frecnum/0.2)-1))
			begin
			q<=10'd0;
			clkdiv<=~clkdiv;
			end
	else
		q=q+10'd1;

endmodule
