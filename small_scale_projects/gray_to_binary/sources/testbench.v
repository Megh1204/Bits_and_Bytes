`timescale 1ns / 1ps

module testbench();

parameter N = 4;

reg [N-1:0] gray;
wire [N-1:0] bin;

gray_to_binary #(.N(4)) uut(.gray(gray), .bin(bin));

//Deliberately giving input stimuli in such a way that binary outputs are successive numbers for easier verification. 
initial begin
#100
#5 gray = 4'b0000;
#5 gray = 4'b0001;
#5 gray = 4'b0011;
#5 gray = 4'b0010;
#5 gray = 4'b0110;
#5 gray = 4'b0111;
#5 gray = 4'b0101;
#5 gray = 4'b0100;
#5 gray = 4'b1100;
#5 gray = 4'b1101;
#5 gray = 4'b1111;
#5 gray = 4'b1110;
#5 gray = 4'b1010;
#5 gray = 4'b1011;
#5 gray = 4'b1001;
#5 gray = 4'b1000;
#20 $stop;
end
endmodule
