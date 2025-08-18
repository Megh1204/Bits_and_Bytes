`timescale 1ns / 1ps

module testbench();

reg clk_100MHz;
reg reset;
reg enable;

wire [15:0] led;
wire [6:0] displayer;
wire [3:0] digit_selector;  
    
  
top_module main_inst(
    .clk_100MHz(clk_100MHz),
    .reset(reset),
    .enable(enable),
    .led(led), 
    .displayer(displayer),
    .digit_selector(digit_selector)
    );

    
always #5 clk_100MHz = ~clk_100MHz;

initial begin 
reset = 1'b1;
#10 clk_100MHz = 1'b0; reset = 1'b0;
#10 enable = 1'b1;


end
    
endmodule
