`timescale 1ns / 1ps

module sr_flipflop_nand(
    input clk,
    input S,
    input R, 
    output Q,
    output Qbar
    );
    
    wire set;
    wire reset;
    
    sr_latch_nand inst(.S(set),.R(reset),.Q(Q),.Qbar(Qbar));
    
    nand nand3(set, S,clk);
    nand nand4(reset, R,clk);
    
endmodule
