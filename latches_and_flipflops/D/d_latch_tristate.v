`timescale 1ns / 1ps

module d_latch_tristate(
    input En,
    input D, 
    output Q
    );
    
    wor Qbar; //Intermediate  wire OR signal
    
    assign Qbar = En ? ~D : ~Q;

    assign Q = ~Qbar;
endmodule
