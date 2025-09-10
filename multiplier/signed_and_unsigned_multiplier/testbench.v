`timescale 1ns / 1ps

module testbench();

localparam input_width = 4;

reg [input_width-1:0] a,b;
wire [2*input_width-1:0] y;

//Can either instantiate signed or unsigned multiplier. 
unsigned_multiplier #(.input_width(input_width)) dut(.a(a),.b(b),.y(y));

    initial begin
        a = 4'b0000; 
        b = 4'b0000;
        //0*0 must give 0.
        
        #5
        a = 4'b0101;
        //a value changed to 5, b is still same.
        //5*0 must give 0.
        
        #5 
        b = 4'b1001;
        //unsigned b = 9 --> 5*9 must give 45 --> 32 + 8 + 4 + 1 --> 0010_1101 
        //signed b = -7 --> 5*-7 must give -35 --> -128 + 64 + 16 + 8 + 4 + 1 --> 1101_1101 
        
        #5 
        b = 4'b1111;
        //unsigned b = 15 --> 5*15 must give 75 --> 64 + 8 + 2 + 1 --> 0100_1011
        //signed b = -1 --> 5*-1 must give -5 --> -128 + 64 + 32 + 16 + 8 + 2 + 1 --> 1111_1011
        
        #10
        $stop;   
    end
     
endmodule
