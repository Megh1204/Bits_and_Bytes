`timescale 1ns / 1ps

module SIPO_shift_register #(parameter N = 4)
    (
    input clk, 
    input reset,
    input serial_in,
    output reg [N-1:0] parallel_out 
    );
    
integer i;
   
always @(posedge clk) begin
    parallel_out [N-1] <= serial_in;
    for (i=N-1;i>0;i=i-1) begin
        parallel_out[i-1] <= parallel_out[i];
    end
end

endmodule
