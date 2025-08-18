`timescale 1ns / 1ps

module four_to_one_mux
    (
    input [1:0] sel,
    input in1,
    input in2,
    input in3,
    input in4,
    output out
    );
    
assign out = (sel == 2'b00) ? in1 : (sel == 2'b01) ? in2 : (sel == 2'b10) ? in3 : in4;

endmodule
