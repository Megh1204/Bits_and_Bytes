`timescale 1ns / 1ps

module dff(
    input clk,
    input rstn, 
    input d,
    output reg q,
    output qn
    );
    
    always @(posedge clk or negedge rstn) begin
        if(!rstn) begin
            q <= 1'b0;
        end else begin
            q <= d;
        end
    end
    
    assign qn = ~q;
    
endmodule
