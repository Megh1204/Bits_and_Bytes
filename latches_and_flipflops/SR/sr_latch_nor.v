`timescale 1ns / 1ps

//Module info: SR latch using NAND gates. 
//Inputs: S and R. 
//Outputs Q and Qbar.

module sr_latch_nor(
    input S,
    input R, 
    output Q, 
    output Qbar
);

nor nor1(Q,R,Qbar);
nor nor2(Qbar,S,Q);

endmodule
