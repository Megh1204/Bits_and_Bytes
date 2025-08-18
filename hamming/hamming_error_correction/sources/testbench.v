`timescale 1ns / 1ps

module testbench();

reg [6:0] h_in;
wire [6:0] h_out;

hamming_error_correction uut(.h_in(h_in), .h_out(h_out));

initial begin
#10 h_in = 7'b0000001;  //correct hamming code for 0000 is 0000000, sending wrong value deliberately, must detect error in P1 bit. h_out = 7'b000_0000;
#10 h_in = 7'b0010111;  //correct hamming code for 0001 is 0000111, sending wrong value deliberately, must detect error in D5 bit, h_out = 7'b000_0111;
#10 h_in = 7'b1000111;  //correct hamming code for 0001 is 1000111, sending wrong value deliberately, must detect error in D7 bit, h_out = 7'b000_0111;
//Can write as many cases as we want.
//Note: Hamming code is primarily deisgned to detect and correct single bit errors. 
//Although it can detect two-bit errors, it cannot correct them. 
#10 $stop;
end

endmodule
