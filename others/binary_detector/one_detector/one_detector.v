`timescale 1ns / 1ps

module one_detector(
    input [63:0] in,
    output out
);

assign out = (|in); //Unary OR operation 

endmodule
