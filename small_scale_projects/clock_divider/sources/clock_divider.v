`timescale 1ns / 1ps

module clock_divider 
    #(parameter divisor = 2) //The divisor must be >= 2
    (
    input reset,
    input wire clk_in,
    output reg clk_out
    );
    
localparam width = $clog2(divisor);
reg [(width-1):0] counter;
    
always @(clk_in or reset) begin
    if(reset) begin
        clk_out <= 1'b0;
        counter <= 1'b0;
    end else if (counter == (divisor-1))begin 
        counter <= 1'b0;
        clk_out <= ~ clk_out;
    end else begin
        counter <= counter + 1;
    end
end

endmodule
