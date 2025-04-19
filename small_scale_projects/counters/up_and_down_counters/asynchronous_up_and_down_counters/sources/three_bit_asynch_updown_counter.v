`timescale 1ns / 1ps

module three_bit_asynch_updown_counter(
    input clk, 
    input reset,
    input m, //m stands for mode, mode = 0 does upcounting and mode = 1 does downcounting.
    output reg [2:0] count
    );
    
    
always @(posedge clk or posedge reset or m) begin
    if (reset) 
        count = 3'b000;
    else if (m == 0) 
        count = count + 1'b1;
    else 
        count = count - 1'b1;
end

endmodule
