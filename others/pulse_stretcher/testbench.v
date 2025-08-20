`timescale 1ns / 1ps

module testbench
    #(parameter STRX = 18)
    ();
    
    reg clk;
    reg reset;
    reg din;
    wire stretched_pulse;

pulse_stretcher #(.STRX(STRX)) dut(
    .clk(clk), 
    .reset(reset), 
    .din(din),
    .stretched_pulse(stretched_pulse));
    
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        reset = 1'b1;
        #20
        din= 1'b0;
    
        #50 
        reset = 1'b0;
        #7 
        din = 1'b1;
        #15 
        din = 1'b0;
        #2000 
        $stop;
    
    end
endmodule
