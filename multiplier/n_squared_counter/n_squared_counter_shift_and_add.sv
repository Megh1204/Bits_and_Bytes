`timescale 1ns / 1ps

module n_squared_counter_shift_and_add
    #(parameter count_width = 4)
    (
    input clk,
    input reset,
    output logic [2*count_width-1:0] count_squared
    );
    
    //Local variable declaration
    reg [count_width-1:0] count;
    integer i;
    reg [2*count_width-1:0] partial_product;

    //Sequential logic to implement count increments.    
    always @(posedge clk) begin
        if(reset)
            count = {count_width{1'b0}};
        else
            count = count + 1'b1;
    end
    
    //Combinational logic for shift and add style multiplier
    always @(*) begin
        partial_product = 0;
        for (i=0;i<count_width;i=i+1) begin
            if(count[i])
                partial_product = partial_product + (count<<i);
        end
    end
    
    assign count_squared = partial_product; 
    
endmodule
