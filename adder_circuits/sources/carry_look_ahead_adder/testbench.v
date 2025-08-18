`timescale 1ns / 1ps

module testbench();

reg [3:0] A;
reg [3:0] B;
reg Cin;

wire [3:0] Sum;
wire Cout;

//The same testbench works for both CLA adder and CLA_adder_pg modules.
//Use only one instantiation at any given time to test either of the designs.


/*
CLA_adder_pg module is a custom N-bit Carry Look Ahead Adder that can be 
expanded to any number of bits based on requirement as it generalizes 
the values P,G and Ci 
P --> Carry Propagate
G --> Carry Generate
Ci --> Intermediate Carry for nth bit addition.
*/
CLA_adder_pg uut1( .A(A) , .B(B) , .Cin(Cin), .Sum(Sum), .Cout(Cout));

/*
CLA_adder module is a detailed level realization of how each intermediate 
carry as well as Cout can be represented as combinational functions just in 
terms of inputs A,B and Cin and nothing else.
The Carry Look Ahead Adder gains alot of timing by writing the Cin to Cout 
critical path in terms of combinational logic rather than waiting for its 
previous carry
*/
//CLA_adder uut2( .A(A) , .B(B) , .Cin(Cin), .Sum(Sum), .Cout(Cout));


initial begin 
Cin=0;
#10 A=4'b0010; B=4'b1111;  //A=2 and B=15, expected_ans = 17 --> 5'b10001
#10 A=4'b0101; B=4'b1110;  //A=5 and B=14, expected_ans = 19 --> 5'b10011
#10 A=4'b1100; B=4'b1001;  //A=12 and B=9, expected_ans = 21 --> 5'b10101
#10 A=4'b1101; B=4'b1101;  //A=13 and B=13, expected_and = 26 --> 5'b11010
//Can check for as many cases as we want.
#10 $stop;
end
endmodule