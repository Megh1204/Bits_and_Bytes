`timescale 1ns / 1ps

module divideby_testbench();

reg clk;
reg reset;

wire divideby2, divideby4 , divideby8 , divideby16;

clock_divider_using_count dut_inst(
    .clk(clk), 
    .reset(reset),
    .divideby2(divideby2),
    .divideby4(divideby4),
    .divideby8(divideby8),
    .divideby16(divideby16)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 1'b0;
        reset = 1'b1;
    
        #14
        reset = 1'b0;
    
    
        #500;
        $stop;
    end
        
endmodule
