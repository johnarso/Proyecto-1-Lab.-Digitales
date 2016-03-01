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
	reg [9:0]qref;
	reg [9:0]q=10'd0;
	initial clkdiv=1'b0;
	always @(posedge clk, posedge reset)
	begin
	qref=frecnum;
	if (reset)
		begin
			q<=10'd0;
			clkdiv<=0;
		end
	else
		begin
		qref=((50000/frecnum)-1);
		if (q==qref)
			begin
			q<=10'd0;
			clkdiv=~clkdiv;
			end
		else
			q=q+10'd1;
		end
	end
endmodule
