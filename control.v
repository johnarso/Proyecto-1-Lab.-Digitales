`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: TEC
// Engineer: Johan Arrieta Solorzano
// 
// Create Date:    23:35:21 02/29/2016 
// Design Name: 
// Module Name:    control 
// Project Name: Proyecto 1
// Target Devices: Nexys 3
// Tool versions: 
// Description: este modulo se encarga de habilitar los cambios en la frecuencia y la corriente 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module control(
    input sel,
    output frec,
    output cor
    );
assign frec=sel;
assign cor=~sel;

endmodule
