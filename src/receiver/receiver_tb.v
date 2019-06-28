`include "receiver.v"


module receiver_tb();
	reg RXD, clk, reset;
	wire rx_busy;
	receiver r1(
		.RXD(RXD),
		.clk(clk),
		.reset(1'b0)
	);


	initial begin
		$dumpfile("receiver_tb.vcd");
		$dumpvars(0,receiver_tb);
		clk = 0;
		//#20 send = 1;
		#20 RXD = 1;
		#20 RXD = 1;
		#20	RXD = 1;
		#20 RXD = 0;
		#20 RXD = 1;
		#20 RXD = 0;
		#20 RXD = 1;
		#20 RXD = 0;
		#20 RXD = 1;
		#20 RXD = 0;
		#20	RXD = 1;
		#20 RXD = 0;
		#20 RXD = 1;
		#20 RXD = 1;
		#20 RXD = 1;
		#20 RXD = 1;
		#20 RXD = 1;
		$finish;
		
	end
	always #10 clk =!clk;
endmodule