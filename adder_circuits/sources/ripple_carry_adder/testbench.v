`timescale 1ns / 1ps

module testbench();

localparam N = 4;
reg [N-1:0] A;
reg [N-1:0] B;

wire [N:0] Sum;

n_bit_ripple_carry_adder #(N) uut(.A(A), .B(B), .Sum(Sum));

initial begin 
#10 A=4'b0010; B=4'b1111;  //A=2 and B=15, expected_ans = 17 --> 5'b10001
#10 A=4'b0101; B=4'b1110;  //A=5 and B=14, expected_ans = 19 --> 5'b10011
#10 A=4'b1100; B=4'b1001;  //A=12 and B=9, expected_ans = 21 --> 5'b10101
#10 A=4'b1101; B=4'b1101;  //A=13 and B=13, expected_and = 26 --> 5'b11010
//Can check for as many cases as we want.
#10 $stop;
end
endmodule
