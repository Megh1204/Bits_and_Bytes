`timescale 1ns / 1ps

//Module info: SR latch using NAND gates. 
//Inputs: S and R. 
//Outputs Q and Qbar.

module sr_latch_nand(
    input S,
    input R, 
    output Q, 
    output Qbar
);

nand nand1(Q,S,Qbar);
nand nand2(Qbar,R,Q);

endmodule
