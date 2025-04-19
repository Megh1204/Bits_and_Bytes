`timescale 1ns / 1ps


module testbench(

    );
    
    parameter N = 4;
    
    reg clk;
    reg reset;
    reg m;
    wire [N-1:0] count;
    
    n_bit_synchronous_updown_counter #(.N(N)) uut
    (
    .clk(clk), 
    .reset(reset), 
    .m(m),
    .count(count)
    );
    
    
    always #5 clk = ~ clk;
    initial begin 
        clk = 1'b0; reset = 1'b1; m = 1'b0; 
        #17 reset = 1'b0;
        #400 m = 1'b1;
        #400 $stop;
    
    end   
    
    
endmodule





