module transmitter(TXD, tx_data, clk, reset, td_busy, send);
	input [7:0]	tx_data;
	input 		send;
	input		clk;
	input		reset;
	output		TXD;
	output 		td_busy;

	parameter waiting = 1'b0;
	parameter writing = 1'b1;
	
	reg txd_reg = 1'b1;


	integer count = 0, status = waiting;

	always @(posedge clk)
		begin
			if(status == waiting) 
				begin
					$display("waiting");
					if(send)
						begin
							status = writing;
							txd_reg = 1'b0;
							count = 0;
						end
				end
			else 
				begin
					$display("writing");
					if(count<8)
						begin
							txd_reg = tx_data[count];
						end
					else
						begin
							status = waiting;
							txd_reg = 1'b1;
						end
				end
		end

	assign td_busy = status;
	assign TXD = txd_reg;
	
endmodule