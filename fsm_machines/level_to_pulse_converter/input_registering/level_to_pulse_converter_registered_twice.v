`timescale 1ns / 1ps

module level_to_pulse_converter(
    input clk, 
    input reset, 
    input data_in,
    output reg pulse
    );
    
    reg data_reg1; //register the data_in
    reg data_reg2;
    
    always @(posedge clk) begin 
        if (reset) begin 
            data_reg1 <= 1'b0;
            data_reg2 <= 1'b0;
        end else begin    
            data_reg1 <= data_in;
            data_reg2 <= data_reg1;
        end        
    end
    
    always @(*) begin
        if(reset) begin
            pulse = 1'b0;
        end else if (data_reg1 && !data_reg2) begin
            pulse = 1'b1;
        end else begin
            pulse = 1'b0;
        end  
    end
endmodule
