`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:09:57 03/05/2016 
// Design Name: 
// Module Name:    DPWM 
// Project Name: 
// Target Devices: 
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
module DPWM(
    input AUMENTO,
	 input DISMINUCION,
	 input RST,
	 input CLOCK_NEXYS,
	 input OPCION,
	 output [7:0] NUM_CODIF,
	 output [3:0] SEL_DIGITO,
	 output PWM
	 );
	 
	 wire reset;
	 assign reset=RST;
	 wire up;
	 wire clknex;
	 assign clknex=CLOCK_NEXYS;
	 wire down;
	 wire selection;
	 wire CLOCK_DIV;
	 wire CLOCK_DISPLAY;
	 wire [9:0]CURRENT;
	 wire [7:0]IND_FREC;
	 
	 wire EN_corriente;
	 wire EN_frecuencia;
	 wire EN_codificador;
	 wire [2:0] FREQUENCY;
	 wire [9:0] CONTADOR_CORRIENTES;	 
	 
	 /*******************INSTANCIA DE LOS FLIP-FLOPS ANTIRREBOTE*******************/
	 FFs instancia_FF_antirrebote(
    .aumentar(AUMENTO),
    .disminuir(DISMINUCION),
    .seleccion(OPCION),
	 .clk(clknex),
	 .reset(reset),
    .au(up),
    .dis(down),
    .sel(selection)
    );
	 
	 /*******************INSTANCIA DEL CONTROL*******************/
	 control instancia_control(
    .sel(selection),
    .frec(EN_frecuencia),
    .cor(EN_corriente),
	 .cod(EN_codificador)
    );
	 
	 /*******************INSTANCIA DEL CONTADOR 3 BITS PROGRESIVO/REGRESIVO*******************/
	 Contador_Prog_Reg_3b instancia_contador_3b_P_R(
	 .boton_aumento(up),			 
	 .boton_disminuye(down), 		 
	 .enable(EN_frecuencia),						 
	 .reset(reset),
	 .numero_frec(FREQUENCY)	 
    );
	 
	 /*******************INSTANCIA DEL CONTADOR 10 BITS PROGRESIVO/REGRESIVO*******************/
	 Contador_Prog_Reg_10b instancia_contador_10b_P_R(
	 .boton_aumento(up),			 
	 .boton_disminuye(down), 		 
	 .enable(EN_corriente),						 
	 .reset(reset),
	 .cant_corriente(CURRENT) 	 
    );
	 
	 /*******************INSTANCIA DE LA MEMORIA DE FRECUENCIAS*******************/
	 Memoria_frecuencias instancia_memo_frecuencias(
	 .CLK(clknex),
	 .num_frecuencia(FREQUENCY),        			
    .reset(reset),
	 .frecuencia(IND_FREC)
	 );
	 
	 /*******************INSTANCIA DEL DIVISOR DE FRECUENCIAS*******************/
	 Divisor_de_frecuencia instancia_divisor_frecuencias(
    .clk(clknex),
	 .reset(reset),
    .frecnum(IND_FREC),
    .clkdiv(CLOCK_DIV),
	 .clk_display(CLOCK_DISPLAY)
    );
	 
	 /*******************INSTANCIA DEL CONTADOR 10 BITS PROGRESIVO*******************/
	 Contador_Prog_10b instancia_contador_10b_P(
		.CLK(CLOCK_DIV),								
		.reset(reset),
		.cuenta(CONTADOR_CORRIENTES)					
    );
	 
	 /*******************INSTANCIA DEL COMPARADOR DE 10 BITS*******************/
	 comparador10 instancia_comparador(
    .n1(CURRENT),
    .n2(CONTADOR_CORRIENTES),
	 .clk(clknex),
	 .reset(reset),
    .pwm(PWM)
    );
	 
	 /*******************INSTANCIA DEL CODIFICADOR 7 SEGMENTOS*******************/
	 Codificador_7_Seg instancia_codificador_7_segmentos(
	 .frecuencia(IND_FREC),							
	 .corriente(CURRENT), 
	 .control(EN_codificador),
	 .reset(reset),
	 .clk_d(CLOCK_DISPLAY),
	 .codificacion(NUM_CODIF),
	 .digito(SEL_DIGITO)
    );

endmodule
