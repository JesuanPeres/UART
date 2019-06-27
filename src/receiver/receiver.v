module uart_receiver(RXD, clk, reset, rx_data, rx_busy);
	input	RXD;
	input	clk;
	input	reset;
	output	[7:0] rx_data;
	output	rx_busy;

	parameter waiting = 1'b0;
	parameter reading = 1'b1;

	reg [7:0]	buffer;
	reg status = waiting;

	integer count = 0;

	always @ (posedge clk)
		begin
			if(reset)
				begin
					status = waiting;
				end
			else if(status == waiting)
				begin
					//$display("waiting");
					if (!RXD) 
						begin
							status = reading;
							count = 0;
						end
				end
			else 
				begin
					//$display("reading");
					if(count < 8)
						begin
							buffer[count] = RXD;
							count++;
						end
					else 
						begin
							status = waiting;
						end
				end
		end

		assign rx_busy = status;
		assign rx_data = buffer;
endmodule
