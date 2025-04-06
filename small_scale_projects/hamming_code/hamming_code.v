`timescale 1ns / 1ps

module hamming_code(
    input [3:0] data,
    output [6:0] hamming_out
    );
    
assign hamming_out[6] = data[3];
assign hamming_out[5] = data[2];
assign hamming_out[4] = data[1];
assign hamming_out[3] = data[3]^data[2]^data[1]; 
assign hamming_out[2] = data[0];
assign hamming_out[1] = data[3]^data[2]^data[0]; 
assign hamming_out[0] = data[3]^data[1]^data[0];

endmodule
