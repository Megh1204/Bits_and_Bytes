`timescale 1ns / 1ps

//In this module, we will realize a half adder only using NOR universal gate.
module nor_half_adder(
    input A,
    input B, 
    output Sum, 
    output Carry
    );

wire x1;
wire x2;
wire x3;
    
nor nor1(x1,A,A);
nor nor2(x2,B,B);
nor nor3(Carry,x1,x2);
nor nor4(x3,A,B);
nor nor5(Sum,Carry,x3);
 
endmodule
