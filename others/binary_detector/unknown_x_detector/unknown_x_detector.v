`timescale 1ns / 1ps

module unknown_x_detector(
    input [63:0] in,
    output out
    );
    
    assign out = ^(in);
endmodule
