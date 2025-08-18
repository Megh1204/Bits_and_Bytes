`timescale 1ns / 1ps

/*
This module contains a N-bit Carry look Ahead Adder circuit using the concept of Carry Generate and Carry Propagate.


CARRY LOOK AHEAD ADDER:
The Ripple carry adder usually waits until the carry from previous stage is generated and hence delays the speed of operation. 
The critical path in a N-bit Ripple carry adder follows C0 through Cn.
We can improve the latency of the design at the cost of increased hardware complexity.
|  A   |   B   |   C   |   Sum   |  Carry  |
|  0   |   0   |   0   |    0    |    0    |
|  0   |   0   |   1   |    1    |    0    |
|  0   |   1   |   0   |    1    |    0    |
|  0   |   1   |   1   |    0    |    1    |
|  1   |   0   |   0   |    1    |    0    |
|  1   |   0   |   1   |    0    |    1    |
|  1   |   1   |   0   |    0    |    1    |
|  1   |   1   |   1   |    1    |    1    |


OBSERVATIONS FROM THE TRUTH TABLE:
--> When A=1 and B=1, the carry 1 is generated regardless of what the previous stage carry is.
--> When A=0 and B=0, carry is never generated regardless of the previous stage carry coming in.
--> When A and B are 1 and 0 (or) 0 and 1, previous stage carry propagates to the current stage.
*/

module CLA_adder_pg #(parameter N=4)
    (
    input [N-1:0] A,
    input [N-1:0] B, 
    input Cin,
    output [N-1:0] Sum, 
    output Cout
    );

//Declaring all intermediate signals.    
wire [N-1:0] G;
wire [N-1:0] P;
wire [N:0] Ci;

//Logic for Carry Generate and Carry Propagate
assign G = A&B;
assign P = A^B;

//Describing the logic for Intermediate carry values Ci
assign Ci[0] = Cin;
genvar i;
generate
    for(i=1;i<N+1;i=i+1) begin
        assign Ci[i] = G[i-1] | (P[i-1]&Ci[i-1]);
    end
endgenerate

//Assign Sum and Cout by using the values of Ci obtained from every instant.
assign Sum = A^B^Ci;
assign Cout = Ci[N];

endmodule
