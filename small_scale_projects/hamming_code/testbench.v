`timescale 1ns / 1ps

module testbench();

reg [3:0] data;
wire [6:0] hamming_out;

hamming_code uut(.data(data), .hamming_out(hamming_out));



initial begin 
#10
#10 data = 4'b0000;  //expected_ans = 0000000
#10 data = 4'b0001;  //expected_ans = 0000111
#10 data = 4'b0010;  //expected_ans = 0011001
#10 data = 4'b0011;  //expected_ans = 0011110
#10 data = 4'b0100;  //expected_ans = 0101010
#10 data = 4'b0101;  //expected_ans = 0101101
#10 data = 4'b0110;  //expected_ans = 0110011
#10 data = 4'b0111;  //expected_ans = 0110100
#10 data = 4'b1000;  //expected_ans = 1001011
#10 data = 4'b1001;  //expected_ans = 1001100
#10 data = 4'b1010;  //expected_ans = 1010010
#10 data = 4'b1011;  //expected_ans = 1010101
#10 data = 4'b1100;  //expected_ans = 1100001
#10 data = 4'b1101;  //expected_ans = 1100110
#10 data = 4'b1110;  //expected_ans = 1111000
#10 data = 4'b1111;  //expected_ans = 1111111 
end
endmodule
