`timescale 1ns / 1ps

module testbench#(
    parameter bin = 4, 
    parameter bcd = 8
    )();
reg reset;
reg [bin-1:0] binary;
wire [bcd-1:0] BCD;

binary_to_BCD uut(.reset(reset), .binary(binary), .BCD(BCD));

initial begin
    reset = 1'b1;
    #30 reset = 1'b0;
    #100 binary = 4'b0000; //binary = 0 ------ BCD --> 0000_0000 
    #100 binary = 4'b0001; //binary = 1 ------ BCD --> 0000_0001
    #100 binary = 4'b0010; //binary = 2 ------ BCD --> 0000_0010
    #100 binary = 4'b0011; //binary = 3 ------ BCD --> 0000_0011
    #100 binary = 4'b0100; //binary = 4 ------ BCD --> 0000_0100
    #100 binary = 4'b0101; //binary = 5 ------ BCD --> 0000_0101
    #100 binary = 4'b0110; //binary = 6 ------ BCD --> 0000_0110
    #100 binary = 4'b0111; //binary = 7 ------ BCD --> 0000_0111
    #100 binary = 4'b1000; //binary = 8 ------ BCD --> 0000_1000
    #100 binary = 4'b1001; //binary = 9 ------ BCD --> 0000_1001
    #100 binary = 4'b1010; //binary = 10 ----- BCD --> 0001_0000
    #100 binary = 4'b1011; //binary = 11 ----- BCD --> 0001_0001
    #100 binary = 4'b1100; //binary = 12 ----- BCD --> 0001_0010
    #100 binary = 4'b1101; //binary = 13 ----- BCD --> 0001_0011
    #100 binary = 4'b1110; //binary = 14 ----- BCD --> 0001_0100
    #100 binary = 4'b1111; //binary = 15 ----- BCD --> 0001_0101
    #100 $stop;
end
endmodule
