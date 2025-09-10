`timescale 1ns / 1ps

module count_square_tb();

localparam count_width = 4;

reg clk;
reg reset;

wire [2*count_width-1:0] count_squared;

n_squared_counter_using_previous_n_square #(.count_width(count_width)) dut(
    .clk(clk),
    .reset(reset),
    .count_squared(count_squared)
    );


always #5 clk = ~clk;

initial begin 
clk = 1'b0;
reset = 1'b1;


#50 
reset = 1'b0;

#600 
$stop;
    
end

endmodule
