`timescale 1ns / 1ps

module SISO_shift_register
    #(parameter N = 4) 
    (
    input clk,
    input reset,
    input serial_in,
    output serial_out
    );

reg [N-1:0] shift_reg;

always @(posedge clk) begin
    if(reset) begin
        shift_reg <= {N{1'b0}};
    end else begin
        shift_reg <= {serial_in, shift_reg[N-1:1]};
    end
end

assign serial_out = shift_reg[0];

endmodule
