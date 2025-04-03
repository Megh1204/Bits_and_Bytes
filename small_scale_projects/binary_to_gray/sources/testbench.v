`timescale 1ns / 1ps

module testbench();

parameter N = 4;

reg [N-1:0] bin;
wire [N-1:0] gray;

/*When overwriting a parameter within a module instantiation, use: 
module_name #(.parameter_name(value)) instance_name(.ports(signals));*/
binary_to_gray #(.N(N)) uut(.bin(bin), .gray(gray));

initial begin
#10 
#5 bin = 4'b0000;  // expected gray value --> 0000 - 0
#5 bin = 4'b0001;  // expected gray value --> 0001 - 1
#5 bin = 4'b0010;  // expected gray value --> 0011 - 3
#5 bin = 4'b0011;  // expected gray value --> 0010 - 2
#5 bin = 4'b0100;  // expected gray value --> 0110 - 6
#5 bin = 4'b0101;  // expected gray value --> 0111 - 7
#5 bin = 4'b0110;  // expected gray value --> 0101 - 5
#5 bin = 4'b0111;  // expected gray value --> 0100 - 4
#5 bin = 4'b1000;  // expected gray value --> 1100 - c
#5 bin = 4'b1001;  // expected gray value --> 1101 - d
#5 bin = 4'b1010;  // expected gray value --> 1111 - f
#5 bin = 4'b1011;  // expected gray value --> 1110 - e
#5 bin = 4'b1100;  // expected gray value --> 1010 - a
#5 bin = 4'b1101;  // expected gray value --> 1011 - b
#5 bin = 4'b1110;  // expected gray value --> 1001 - 9
#5 bin = 4'b1111;  // expected gray value --> 1000 - 8
end

/*
This Gray code can also be derived for K-map.
-------------------------
|  0  |  1  |  3  |  2  | 
|  4  |  5  |  7  |  6  | 
|  C  |  D  |  F  |  E  | 
|  8  |  9  |  B  |  A  | 
-------------------------
This is the positional encoding of a K-map with respect to binary digits 
Go from left to right on first line,
and then from right to left on the second line, 
and then from left to right on the third line, 
and so on in a snake pattern.

Following the snake pattern observed above: 
gray   --> 0-1-3-2-6-7-5-4-c-d-f-e-a-b-9-8
binary --> 0-1-2-3-4-5-6-7-8-9-a-b-c-d-e-f
*/

endmodule
