`timescale 1ns / 1ps

/*The output of an input majority circuit is high if the majority of inputs is a logic 1, 
else the output is 0.
Let's say, if we have a 3 bit input, 2 or 3 input bits must be 1 for output logic high. 
If w have a 4-bit input, 3 or 4 input bits must be 1 for output logic high.

Since, we will have better comparisons for input bits with odd number of inputs, we will 
consider the input majority circuit for a 5-bit input.

a b c d e y
0 0 0 0 0 0
0 0 0 0 1 0
0 0 0 1 0 0
0 0 0 1 1 0
0 0 1 0 0 0
0 0 1 0 1 0
0 0 1 1 0 0
0 0 1 1 1 1
0 1 0 0 0 0
0 1 0 0 1 0
0 1 0 1 0 0 
0 1 0 1 1 1
0 1 1 0 0 0
0 1 1 0 1 1
0 1 1 1 0 1
0 1 1 1 1 1
1 0 0 0 0 0
1 0 0 0 1 0
1 0 0 1 0 0
1 0 0 1 1 1
1 0 1 0 0 0
1 0 1 0 1 1
1 0 1 1 0 1
1 0 1 1 1 1
1 1 0 0 0 0
1 1 0 0 1 1
1 1 0 1 0 1
1 1 0 1 1 1
1 1 1 0 0 1
1 1 1 0 1 1
1 1 1 1 0 1
1 1 1 1 1 1

out = m(7,11,13,14,15,19,21,22,23,25,26,27,28,29,30,31) //16 minterms.



*/

module input_majority_circuit(
    input [4:0] in, 
    output out
    );
    
    wire int1;
    //Intermediate node 1 is: All inputs being 1.
    assign int1 = (in[1] & in[2] & in[3] & in[4] & in[5]);
    
    wire int2;
    //Intermediate node 2 is : Four inputs being 1. --> 5C4 combinations.
    assign int2 = (~in[1] & in[2] & in[3] & in[4] & in[5]) | 
                  (in[1] & ~in[2] & in[3] & in[4] & in[5]) |
                  (in[1] & in[2] & ~in[3] & in[4] & in[5]) |
                  (in[1] & in[2] & in[3] & ~in[4] & in[5]) |
                  (in[1] & in[2] & in[3] & in[4] & ~in[5]);
                  
    wire int3;
    //Intermediate node 3 is : Any three inputs being 1. --> 5C3 combinations.      
    assign int3 = (~in[1] & ~in[2] & in[3] & in[4] & in[5]) | 
                  (~in[1] & in[2] & ~in[3] & in[4] & in[5]) |
                  (~in[1] & in[2] & in[3] & ~in[4] & in[5]) |
                  (~in[1] & in[2] & in[3] & in[4] & ~in[5]) |
                  (in[1] & ~in[2] & ~in[3] & in[4] & in[5]) |
                  (in[1] & ~in[2] & in[3] & ~in[4] & in[5]) |
                  (in[1] & ~in[2] & in[3] & in[4] & ~in[5]) |
                  (in[1] & in[2] & ~in[3] & ~in[4] & in[5]) |
                  (in[1] & in[2] & ~in[3] & in[4] & ~in[5]) |
                  (in[1] & in[2] & in[3] & ~in[4] & ~in[5]);
                      
endmodule
