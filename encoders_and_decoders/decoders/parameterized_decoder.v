`timescale 1ns / 1ps

/*A large N:2^N decoder is cumbersome to specify with case statements, 
but easy using parameterized code that simply sets the appropriate output bit to 1. 
Specifically, the decoder uses blocking assignments to set all the bits to 0, 
then changes the appropriate bit to 1.*/

module parameterized_decoder
    #(parameter N = 3)
    (
        input [N-1:0] A,
        output reg [2**N-1:0] Y
    );
    
    always @(*) begin
        Y = {2**N{1'b0}};
        Y[A] = 1'b1;
    end
    
endmodule
