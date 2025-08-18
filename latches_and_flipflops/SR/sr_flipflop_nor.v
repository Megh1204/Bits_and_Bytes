`timescale 1ns / 1ps

module sr_flipflop_nor(
    input clk,
    input S,
    input R, 
    output Q,
    output Qbar
    );
    
    wire set;
    wire reset;
    
    sr_latch_nor inst(.S(set),.R(reset),.Q(Q),.Qbar(Qbar));
    
    and and3(set, S,clk);
    and and4(reset, R,clk);
    
endmodule
