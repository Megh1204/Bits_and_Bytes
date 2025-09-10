`timescale 1ns / 1ps

module signed_multiplier
    #(parameter input_width = 4)
    (
    input logic signed [input_width-1:0] a,b,
    output logic signed [2*input_width-1:0] y
    );
    
    assign y = a*b; 
    
endmodule
