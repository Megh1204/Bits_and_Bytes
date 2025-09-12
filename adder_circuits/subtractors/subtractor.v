`timescale 1ns / 1ps

//I have two inputs A and B, and let's say I want A-B.

module subtractor
    #(parameter input_width = 8)
    (
    input [input_width-1:0] a,b,
    output [input_width-1:0] result
    );
    
    wire neg_b = ~b + 1'b1; //2's complement of b obtained by inverting all bits in b and adding 1.
    
    assign result = a + neg_b; //Add a and neg_b.
    
endmodule
