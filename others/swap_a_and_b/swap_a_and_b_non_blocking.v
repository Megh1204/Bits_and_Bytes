`timescale 1ns / 1ps

//Verilog code to swap the contents of two registers

module swap_a_and_b(
    input clk, 
    input reset);

reg a;
reg b;

//Without using additional registers 
always @(posedge clk) begin
    a<=b;
    b<=a;    
end

endmodule
