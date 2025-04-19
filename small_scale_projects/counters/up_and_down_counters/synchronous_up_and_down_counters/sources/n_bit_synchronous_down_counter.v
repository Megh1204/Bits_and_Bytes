`timescale 1ns / 1ps

module n_bit_synchronous_down_counter #(parameter N = 4)
    (
    input clk, 
    input reset, 
    output reg [N-1:0] count
    );
    
integer i;
    
always @(posedge clk) begin
    if (reset) begin 
        count <= {N{1'b1}};
    end else begin
        count <= count - 1'b1;
    end
end
endmodule
