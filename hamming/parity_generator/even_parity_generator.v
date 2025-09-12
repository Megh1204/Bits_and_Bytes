`timescale 1ns / 1ps
//For an even parity generator, the output must have even number of 1's. 

module even_parity_generator
    #(parameter input_width = 3)
    (
    input [input_width-1:0] in,
    output [input_width:0] out
    );
    
    //Input shifts to the left and LSB bit is parity. XOR is odd 1's detector.
    assign out = {in[input_width-1:0],~^in}; //LSB is Unary/Reduction XOR of all input bits.
    
endmodule
