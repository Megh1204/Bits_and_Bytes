`timescale 1ns / 1ps

module testbench();

reg clk;
reg rstn;
wire [3:0] out;


ripple_counter dut(.clk(clk),.rstn(rstn),.out(out));

always #5 clk = ~clk;

initial begin
    
    clk = 1'b0;
    rstn = 1'b0;
    
    #22 
    rstn = 1'b1;
   
    #500 
    
    $stop;
end

 
endmodule
