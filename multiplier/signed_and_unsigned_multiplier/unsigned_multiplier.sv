`timescale 1ns / 1ps

module unsigned_multiplier
    #(parameter input_width = 4)
    (
    input logic [input_width-1:0] a,b,
    output logic [2*input_width-1:0] y
    );
    
    assign y = a*b; 
    
endmodule
