`timescale 1ns / 1ps

module half_adder(
    input A, 
    input B,
    output sum, 
    output carry
    );
    
    assign carry = A&B;
    
//Sum can be realized in two ways. Either with or without using XOR gate.
    //Sum using XOR gate
    assign sum = A^B;
    //Sum without using XOR gate
    //assign sum = (A|B)&(~carry);
endmodule
