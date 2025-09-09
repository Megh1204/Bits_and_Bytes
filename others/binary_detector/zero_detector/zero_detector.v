`timescale 1ns / 1ps

module zero_detector(
    input [63:0] in,
    output out
);

assign out = ~(&in); //active high output. 

endmodule
