`timescale 1ns / 1ps

module d_latch_using_mux(
    input En,
    input D,
    output Q
    );
    
    assign Q = En ? D : Q;
endmodule
