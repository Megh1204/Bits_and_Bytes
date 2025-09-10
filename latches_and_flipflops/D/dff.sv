`timescale 1ns / 1ps

module dff(
    input logic clk, 
    input logic D,
    output logic Q
);
    
    always_ff @(posedge clk) begin
        Q<=D;
    end
    
endmodule
