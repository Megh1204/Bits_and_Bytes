`timescale 1ns / 1ps

module testbench();

parameter N = 4;

reg clk;
reg reset;
reg serial_in;

wire [N-1:0] parallel_out;

SIPO_shift_register #(.N(N)) uut
    ( .clk(clk), .reset(reset), .serial_in(serial_in) , .parallel_out(parallel_out));
    
always #5 clk = ~clk;

initial begin
    clk= 1'b0; reset = 1'b1;
    #12 reset = 1'b0;
    #10 serial_in = 1'b1;
    #10 serial_in = 1'b0;
    #10 serial_in = 1'b1;
    #10 serial_in = 1'b1;  
    #50 $stop;
    
end
endmodule
