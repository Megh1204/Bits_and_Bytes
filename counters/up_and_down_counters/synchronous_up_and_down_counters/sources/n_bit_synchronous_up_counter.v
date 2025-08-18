`timescale 1ns / 1ps

module n_bit_synchronous_up_counter #(parameter N = 4)
    (
    input clk, 
    input reset, 
    output reg [N-1:0] count
    );
    
always @(posedge clk) begin
    if (reset) begin 
        count <= 1'b0;
    end else begin
        count <= count + 1'b1;
    end
end
endmodule
