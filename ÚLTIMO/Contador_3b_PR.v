`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:05 03/07/2016 
// Design Name: 
// Module Name:    Contador_3b_PR 
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
module Contador_3b_PR(
	 input btn_up,
	 input btn_down,
	 input clk_nx,
	 input rst,
	 input enable,
	 output [2:0] frec_num
    );
	 
	 reg [2:0] cuenta;
	 reg referencia_up;
	 reg referencia_down;
	 
	 always @(posedge clk_nx)
	 begin
		if (rst)
		begin	
			cuenta=3'd0;
			referencia_up=0;
			referencia_down=0;
		end
		else if (enable)
		begin
			if (btn_up>referencia_up)
			begin
				cuenta=cuenta+3'd1;
				referencia_up=btn_up;
			end
			else if (btn_down>referencia_down)
			begin
				cuenta=cuenta-3'd1;
				referencia_down=btn_down;
			end
			else if (btn_up<referencia_up) referencia_up=btn_up;
			else if (btn_down<referencia_down) referencia_down=btn_down;
		end
	 end
	 assign frec_num=cuenta;

endmodule
