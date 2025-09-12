`timescale 1ns / 1ps
//For an odd parity generator, the output must have odd number of 1's. 

module odd_parity_generator
    #(parameter input_width = 3)
    (
    input [input_width-1:0] in,
    output [input_width:0] out
    );
    
    //Input shifts to the left and LSB bit is parity. XNOR is even 1's detector.
    assign out = {in[input_width-1:0],~^in}; //LSB is Unary/Reduction XNOR of all input bits.
    
endmodule
