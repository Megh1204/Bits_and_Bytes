`timescale 1ns / 1ps

module testbench();


reg [3:0] in;
wire [1:0] out;

priority_encoder uut1(.in(in), .out(out));


initial begin
#10 
#5 in = 4'b0000;  // expected_ans --> 2'bxx
#5 in = 4'b0001;  // expected_ans --> 2'b00
#5 in = 4'b0010;  // expected_ans --> 2'b01
#5 in = 4'b0011;  // expected_ans --> 2'b01
#5 in = 4'b0100;  // expected_ans --> 2'b10
#5 in = 4'b0101;  // expected_ans --> 2'b10
#5 in = 4'b0110;  // expected_ans --> 2'b10
#5 in = 4'b0111;  // expected_ans --> 2'b10
#5 in = 4'b1000;  // expected_ans --> 2'b11
#5 in = 4'b1001;  // expected_ans --> 2'b11
#5 in = 4'b1010;  // expected_ans --> 2'b11
#5 in = 4'b1011;  // expected_ans --> 2'b11
#5 in = 4'b1100;  // expected_ans --> 2'b11
#5 in = 4'b1101;  // expected_ans --> 2'b11
#5 in = 4'b1110;  // expected_ans --> 2'b11
#5 in = 4'b1111;  // expected_ans --> 2'b11
#5 in = 4'b0000;  //If all values are zero, output will retain its previous value. 
#5 in = 4'b0111;  // expected_ans --> 2'b10
#5 in = 4'b0000;  //If all values are zero, output will retain its previous value.
#5 $stop;
end

endmodule

