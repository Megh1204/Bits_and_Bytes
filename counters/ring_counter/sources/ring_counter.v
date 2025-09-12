`timescale 1ns/1ps

module ring_counter #(parameter N = 4)
	(
	input clk, 
	input ORI, //ORI stands for overriding input
	output reg [N-1:0] out
	);
	
	integer i;
	
always @(posedge clk or negedge ORI) begin
	if (ORI == 0) begin
		out <= {N{1'b1,{(N-1){1'b0}}}};
	end else begin
		out[N-1] <= out[0];
		for (i=1;i<N; i=i+1) begin
			out[i-1] <= out[i];
		end
	end
end

endmodule 
