`timescale 1ns / 1ps

//In this module, we will realize a half adder only using NAND universal gate.
module nand_half_adder(
    input A, 
    input B, 
    output Sum, 
    output Carry);

wire x1;
wire x2;
wire x3;
    
nand nand1(x1,A,B);
nand nand2(x2,x1,A);
nand nand3(x3,x1,B);
nand nand4(Sum,x2,x3);
nand nand5(Carry,x1,x1);

endmodule
