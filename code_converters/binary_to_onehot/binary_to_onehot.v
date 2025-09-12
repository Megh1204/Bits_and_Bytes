`timescale 1ns / 1ps

module binary_to_onehot
    #(parameter input_width = 4)
    (
        input [input_width-1:0]binary_input, 
        output [(2**input_width)-1:0] onehot_output
    );
    
    assign onehot_output = 1'b1 << binary_input;
    
endmodule
