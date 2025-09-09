`timescale 1ns / 1ps

module negedge_detector(
    input clk, 
    input resetn,
    input data_in, 
    output negedge_detected
    );
    
    reg q1;
    reg q2;
    
    always @(posedge clk or negedge resetn) begin
        if(~resetn) begin
            q1 <= 1'b0;
            q2 <= 1'b0;
        end else begin
            q1 <= data_in;
            q2 <= q1;
        end
    end
    
    assign negedge_detected = ~q1^q2;
    
endmodule
