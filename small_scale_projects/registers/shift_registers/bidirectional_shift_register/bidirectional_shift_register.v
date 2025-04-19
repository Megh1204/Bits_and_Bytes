`timescale 1ns / 1ps

module bidirectional_shift_register #(parameter N = 4)
    (
    input clk,
    input reset,
    input left_right_mode, //0 --> shift_left, 1--> shift_right
    input in,
    output reg [N-1:0] out
    );
    
    always @(*) begin
        if(reset) begin
            out <= {N{1'b0}};
        end else if (~left_right_mode) begin
            out[N-1:1] <= out[N-2:0];
            out[0] <= in;
        end else begin
            out[N-2:0] <= out[N-1:1];
            out[N-1] <= in;
        end
        
    end
    
    
endmodule
