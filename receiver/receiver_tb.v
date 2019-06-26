`include "receiver.v"
`timescale 1us/1ns

module receiver_tb;
	//RXD, clk, reset, rx_data, rx_busy
	reg clk = 1'b0;
	reg reset = 1'b0;
	reg RXD = 1'b0;

	reg count = 0;
	reg [7:0] rx_tranmition;

	always @ (posedge clk)
	begin
		
	end


endmodule