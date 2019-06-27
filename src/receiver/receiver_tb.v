`include "receiver.v"


module receiver_tb();
	receiver r1(
		.RXD(1'b0),
		.clk(1'b0),
		.reset(1'b0)
	);


	initial begin
		$dumpfile("receiver_tb.vcd");
		$dumpvars(0,receiver_tb);
	end
endmodule