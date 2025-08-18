`timescale 1ns / 1ps


/*
This module contains a 4-bit Carry look Ahead Adder circuit using only inputs a,B and Cin.


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

module CLA_adder(
    input [3:0] A,
    input [3:0] B,
    input Cin, 
    output [3:0] Sum,
    output Cout
    );

wire [3:0] Ci;


assign Ci[0] = Cin;
assign Ci[1] = (A[0]&B[0]) | (A[0]^B[0])&Cin;
assign Ci[2] = (A[1]&B[1]) | (A[1]^B[1])&((A[0]&B[0]) | (A[0]^B[0])&Cin);
assign Ci[3] = (A[2]&B[2]) | (A[2]^B[2])&((A[1]&B[1]) | (A[1]^B[1])&((A[0]&B[0]) | (A[0]^B[0])&Cin));
assign Cout = (A[3]&B[3]) | (A[3]^B[3])&((A[2]&B[2]) | (A[2]^B[2])&((A[1]&B[1]) | (A[1]^B[1])&((A[0]&B[0]) | (A[0]^B[0])&Cin)));
assign Sum = A^B^Ci;

endmodule
