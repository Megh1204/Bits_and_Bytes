`timescale 1ns / 1ps

//Verilog code to swap the contents of two registers

module swap_a_and_b(
    input clk, 
    input reset);

reg a;
reg b;

reg temp;

//By using an additional temp register
 
always @(posedge clk) begin
    temp=b;
    b=a;
    a=temp;    
end

endmodule
