`timescale 1ns / 1ps
//A simple clock divide by 2 based on count 

module clock_divider_using_count(
    input clk, 
    input reset,
    output divideby2,
    output divideby4,
    output divideby8,
    output divideby16
    );
    
    //Temporary register to store count.
    reg [3:0] count;
    
    always @(posedge clk) begin
        if(reset) begin
            count = 4'b0000;
        end else begin
            count = count + 1'b1;
        end
    end

    assign divideby2 = count[0];
    assign divideby4 = count[1];
    assign divideby8 = count[2];
    assign divideby16 = count[3];
            

endmodule
