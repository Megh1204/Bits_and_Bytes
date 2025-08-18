`timescale 1ns / 1ps

module level_to_pulse_converter(
    input clk, 
    input reset, 
    input data_in,
    output reg pulse
    );
    
    reg data_old; //register the data_in
    
    always @(posedge clk) begin 
        if (reset) begin 
            data_old <= 1'b0;
        end else begin    
            data_old <= data_in;
        end        
    end
    
    always @(*) begin
        if(reset) begin
            pulse = 1'b0;
        end else if (data_in && !data_old) begin
            pulse = 1'b1;
        end else begin
            pulse = 1'b0;
        end  
    end
endmodule
