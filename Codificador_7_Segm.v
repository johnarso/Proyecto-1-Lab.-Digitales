`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 	TEC	
// Engineer: Melissa Fonseca Rodríguez
// 
// Create Date:    14:46:09 03/04/2016 
// Design Name: 	
// Module Name:    Codificador 7 segmentos 
// Project Name: DPWM
// Target Devices: Nexys3
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
module Codificador_7_Seg(
	 input [7:0] frecuencia,							//proviene de la memoria de frecuencia
	 input [9:0] corriente, 
	 input control,
	 input reset,
	 input clk_d,
	 output reg [7:0] codificacion,
	 output reg [3:0] digito
    );
	 
	 reg [1:0] contador;
	 reg [9:0] variable;
	 
	 always @(posedge clk_d)
	 begin
		 if (reset)
			begin contador<=2'b00;
			variable<=frecuencia; end
		 if (control==1 && contador==0)					//escoje el modo de operación frecuencia o corriente
			variable<=frecuencia;
		 else if (control==0 && contador==0)
			variable<=corriente;
		
		if (variable==10'd0)									//realiza las operaciones según cada caso
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b11111111;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b11111111;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd30)								
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10000110;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b11111111;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
			
		else if (variable==10'd50)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10100100;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b11111111;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
			
		else if (variable==10'd75)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10100100;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10001111;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b11111111;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd100)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10000001;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b11001111;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
			
		else if (variable==10'd125)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10100100;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10010010;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b11001111;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd150)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10100100;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b11001111;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd175)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10100100;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10001111;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b11001111;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase 
		
		else if (variable==10'd200)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10000001;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10010010;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd250)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10100100;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10010010;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd300)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10000001;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10000110;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd350)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10100100;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10000110;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd400)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10000001;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b11001100;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd450)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10100100;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b11001100;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd500)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10000001;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10100100;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd550)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10100100;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10100100;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd600)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10000001;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10100000;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd650)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10100100;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10100000;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd700)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10000001;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10001111;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd750)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10100100;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10001111;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd800)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10000001;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10000000;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd850)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10100100;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10000000;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd900)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10000001;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10000100;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd950)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10100100;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10000100;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11111111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase
		
		else if (variable==10'd1000)
			case (contador)
				0: begin
					digito<=4'd1;
					codificacion<=8'b10000001;
				end
				1:begin
					digito<=4'd2;
					codificacion<=8'b10000001;
				end
				2: begin
					digito<=4'd4;
					codificacion<=8'b10000001;
				end
				3: begin
					digito<=4'd8;
					codificacion<=8'b11001111;
				end
				default: begin
					digito<=4'd1;
					codificacion<=8'b11111111;
				end
			endcase

		contador<=contador+2'd1;
	
	 end

endmodule
