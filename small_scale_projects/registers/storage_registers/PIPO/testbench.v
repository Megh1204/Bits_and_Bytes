`timescale 1ns / 1ps

module testbench();

parameter N = 4;

reg clk;
reg reset;
reg [N-1:0] parallel_in;
wire [N-1:0] parallel_out;

PIPO #(.N(N)) uut
    (.clk(clk),
    .reset(reset),
    .parallel_in(parallel_in),
    .parallel_out(parallel_out)
    );
    
always #5 clk = ~clk;
    
initial begin
    clk = 1'b0; 
    #5 reset =1'b1;
    #10 parallel_in = 4'b1011;
    #1 reset = 1'b0;
    #50 $stop;
end
endmodule
