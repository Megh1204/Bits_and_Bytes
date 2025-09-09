`timescale 1ns / 1ps

module testbench();

reg [63:0] in;
wire out;

zero_detector inst(
    .in(in),
    .out(out)
    );
    
initial begin
    in = 64'b0;
    #10
    in = 64'b1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111;
    
    #10
    in = 64'b1111_1111_1111_1111_1111_1110_1111_1111_1111_1111_1111_1111_1111_1111_1111_1111;

    #50
    $stop;
end 

endmodule
