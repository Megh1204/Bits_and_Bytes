`timescale 1ns / 1ps


module testbench();

parameter N = 4;

reg clk; 
reg ORI;

wire [N-1:0] out;  
    
ring_counter #(.N(N)) uut
	(
	.clk(clk), 
	.ORI(ORI), //ORI stands for overriding input
	.out(out)
	);
	
always #5 clk = ~clk;

initial begin
    clk = 1'b0; ORI = 1'b0;
    #34 ORI = 1'b1; 

end

endmodule
