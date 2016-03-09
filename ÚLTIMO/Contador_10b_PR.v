`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:40 03/07/2016 
// Design Name: 
// Module Name:    BBBBB 
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
module BBBBB(
	 input btn_up,
	 input btn_down,
	 input clk_nx,
	 input rst,
	 output [9:0] cant_corriente
    );
	 
	 reg [9:0] cuenta;
	 reg referencia_up;
	 reg referencia_down;
	 
	 always @(posedge clk_nx)
	 begin
		if (rst)
		begin	
			cuenta=10'd501;
			referencia_up=0;
			referencia_down=0;
		end
		else if (btn_up>referencia_up)
		begin
			referencia_up=btn_up;
			if (cuenta==10'd1000)						//condicion debido al limite de corriente
				cuenta=10'd0;
			else
				cuenta=cuenta+10'd50;
		end
		else if (btn_down>referencia_down)
		begin
			referencia_down=btn_down;
			if (cuenta==0)						//condicion debido al limite de corriente
				cuenta=10'd1000;
			else
				cuenta=cuenta-10'd50;
		end
		else if (btn_up<referencia_up) referencia_up=btn_up;
		else if (btn_down<referencia_down) referencia_down=btn_down;
	 end
	 assign cant_corriente=cuenta;

endmodule
