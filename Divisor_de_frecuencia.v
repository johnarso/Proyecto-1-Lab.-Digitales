`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Johan Arrieta Solórzano
// 
// Create Date:    18:32:17 02/29/2016 
// Design Name: 
// Module Name:    
// Project Name: Proyecto 1
// Target Devices: Nexys 3
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
module Divisor_de_frecuencia(
    input wire clk,reset,
    input wire [7:0] frecnum,
    output reg clkdiv
    );
	reg [6:0]qref;
	reg [6:0]q;
	wire [6:0]div;
	wire [7:0]frec;
	memoria_div instancia_mem(   
	.num(frec),
	.clock(clk),
	.reset(reset),
	.numdiv(div)
 );
 assign frecnum=frec;
	always @(posedge clk, posedge reset)
	begin
	
	if (reset)
		begin
			q<=7'd0;
			clkdiv<=0;
		end
	else
		begin
		qref=((div)-1);
		if (q==qref)
			begin
			q<=7'd0;
			clkdiv=~clkdiv;
			end
		else
			q=q+7'd1;
		end
	end
endmodule
