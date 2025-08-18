`timescale 1ns / 1ps

module PIPO #(parameter N=4)
    (
    input clk, 
    input reset,
    input [N-1:0] parallel_in,
    output reg [N-1:0] parallel_out
    );
    
always @(posedge clk) begin
    if(reset) 
        parallel_out <= {N{1'b0}};
    else 
        parallel_out <= parallel_in;
end

endmodule
