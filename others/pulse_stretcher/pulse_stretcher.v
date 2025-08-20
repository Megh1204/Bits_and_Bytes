`timescale 1ns/1ps

module pulse_stretcher 
    #(parameter STRX = 8) 
    (
     input clk, 
     input reset,
     input din,
     output reg stretched_pulse
     );
     
     reg [$clog2(STRX):0] count;
     
     always @(posedge clk or posedge reset) begin
        if(reset) begin
            count <= 0;
            stretched_pulse <= 1'b0;
        end else if (din) begin
            //start stretching the signal when the input din comes
            count <= STRX - 1'b1;
            stretched_pulse <= 1'b1;
        end else if (count !=0) begin
            //Keep stretching until the counter expires
            stretched_pulse <= 1'b1;
            count = count - 1'b1;
        end else begin
            //deassert stretched pulse after the counter expires 
            stretched_pulse <= 1'b0;
        end
     end
   
endmodule 
     
