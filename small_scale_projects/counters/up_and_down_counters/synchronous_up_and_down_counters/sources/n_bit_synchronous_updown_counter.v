`timescale 1ns / 1ps

module n_bit_synchronous_updown_counter #(parameter N = 4)
    (
    input clk, 
    input reset,
    input m, //m stands for mode, mode = 0 does upcounting and mode = 1 does downcounting.
    output reg [N-1:0] count
    );
    
    
always @(posedge clk) begin
    if (reset) 
        count = {N{1'b0}};
    else if (m == 0) 
        count = count + 1'b1;
    else 
        count = count - 1'b1;
end

endmodule
