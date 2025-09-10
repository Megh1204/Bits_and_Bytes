`timescale 1ns / 1ps

module n_squared_counter
    #(parameter count_width = 4)
    (
    input clk,
    input reset,
    output logic [2*count_width-1:0] count_squared
    );
    
    //Local variable declaration
    reg [count_width-1:0] count;

    //Sequential logic to implement count increments.    
    always @(posedge clk) begin
        if(reset)
            count = {count_width{1'b0}};
        else
            count = count + 1'b1;
    end
    
assign count_squared = count*count;
    
endmodule
