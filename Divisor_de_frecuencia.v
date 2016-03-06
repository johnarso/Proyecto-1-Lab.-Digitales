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
    output reg clkdiv,
	 output reg clk_display
    );
	reg [6:0]qref;
	reg [6:0]q;
	wire [6:0]div;
	wire [7:0]frec;
	reg [14:0]i;
	memoria_div instancia_mem(   
	.num(frec),
	.clock(clk),
	.reset(reset),
	.numdiv(div)
 );
		
	always @(posedge clk, posedge reset)
	begin
	if (reset)
		begin
		if (clkdiv==0 && clk_display==0)
			begin
				clkdiv<=1;
				clk_display<=1;
			end
		else
			begin
				q<=7'd0;
				i<=10'd0;
				clkdiv<=0;
				clk_display<=0;
			end
		end
	else
		begin
		//para el display
		if (i==15'd12499)
		begin
			i<=15'd0;
			clk_display<=~clk_display;
		end
		else if (i!=15'd12499)
			i<=i+15'd1;
			
		//para la frecuencia que el usuario selecciona
		qref=((div)-1);
		
		if (q==qref)
			begin
			q<=7'd0;
			clkdiv<=~clkdiv;
			end
		else
			q<=q+7'd1;
		end
	end
	assign frecnum=frec;

endmodule
