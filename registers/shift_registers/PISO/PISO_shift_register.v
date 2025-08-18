`timescale 1ns / 1ps

module PISO_shift_register #(parameter N = 4)
    (
    input clk, 
    input reset, 
    input shift_nload, // 1 = Shift, 0 = Load
    input [N-1:0] parallel_in, 
    output serial_out
    );
    
reg [N-1:0] shift_reg;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        shift_reg <= 0;
    end else begin
        case (shift_nload)
            1'b0: shift_reg <= parallel_in; // Load mode
            1'b1: shift_reg <= {1'bx, shift_reg[N-1:1]}; // Shift right, insert 0 at MSB
        endcase
    end
end

assign serial_out = (shift_nload) ? shift_reg[0] : 1'bx; //The LSB bit will keep shifting out

endmodule
