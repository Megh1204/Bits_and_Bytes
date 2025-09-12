`timescale 1ns / 1ps

/*
By writing such a parameterized code, we can build any random N-bit MUX using the same verilog code, 
However, in this style of coding, we need to ensure that the select signal value never goes beyond N-1. 
If it goes beyond N-1, we can just assign the output to x.
*/
module n_to_1_mux
    #(parameter N = 6)
    (
        input [N-1:0] in,           //If we have 6 inputs           
        input [$clog2(N)-1:0] sel,  //$clog2(6) is 3, hence we need 3 bit select
        output y
    );
    
    assign y = (sel<N) ? in[sel] : 1'bx; //If sel is less than 6 i.e., 0 to 5.
    

endmodule
