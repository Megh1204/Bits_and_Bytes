`timescale 1ns / 1ps

module testbench();

reg reset;
reg clk_in;
wire clk_out;


clock_divider 
    #(.divisor(6)) inst(
    .reset(reset),
    .clk_in(clk_in),
    .clk_out(clk_out)
    );
  
always #5 clk_in = ~clk_in;
  
initial begin
reset = 1'b1; clk_in = 1'b0;
#10 reset = 1'b0;
end
endmodule
