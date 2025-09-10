`timescale 1ns / 1ps

module n_squared_counter_using_previous_n_square
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
        if(reset) begin
            count <= {count_width{1'b0}};
            count_squared <= {2*count_width{1'b0}};
        end else begin
            count <= count + 1'b1;
            count_squared <= count_squared + (count<<1) + 1'b1;
        end          
    end

endmodule
