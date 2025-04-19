`timescale 1ns / 1ps

module testbench();
    
parameter N = 4;

reg clk;
reg reset;
reg in;
wire out;
    
SISO_shift_register #(.N(N)) uut 
    (.clk(clk), .reset(reset), .serial_in(in), .serial_out(out));

always #5 clk = ~ clk;


initial begin
clk = 1'b0; reset = 1'b1;
#1 reset = 1'b0;
#3 in = 1'b1;
#10 in = 1'b0;
#10 in = 1'b1;
#10 in = 1'b1;

#50 $stop;
end


endmodule
