`timescale 1ns / 1ps

module testbench();

parameter N = 4;

reg clk;
reg reset;
reg shift_nload;
reg [N-1:0] parallel_in;
wire serial_out;

PISO_shift_register #(.N(N)) uut
    (.clk(clk) , 
    .reset(reset) , 
    .shift_nload(shift_nload), 
    .parallel_in(parallel_in),
    .serial_out(serial_out)
    );
    
always #5 clk = ~ clk;

initial begin
clk = 1'b0; shift_nload = 1'b0;
#17 reset = 1'b0;
#1 parallel_in = 4'b1011;
#40 shift_nload = 1'b1;
#50 $stop;
end

endmodule
