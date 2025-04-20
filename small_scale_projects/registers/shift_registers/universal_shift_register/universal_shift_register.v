`timescale 1ns / 1ps

/*
In this module, I designed a 4-bit universal shift register, that can perform one of the 
four operations based on the selector variable using a 4*1 MUX. 

Since, this is a 4-bit universal shift register, 4 such MUXes need to be used to select 
the working of each bit.

*/
module universal_shift_register(
    input clk,                                      
    input clear,               //to reset the contents of the flipflops
    input [1:0] sel,           //selector variable to choose the mode of operation
    input serial_in_right,     //serial input for right shift operation
    input serial_in_left,      //serial input for left shift operation
    input [3:0] parallel_in,   //Parallel input for parallel loading  
    output reg [3:0] out       //Register to store the output of the flip-flops
    );

wire [3:0] mux_out;

four_to_one_mux inst3( 
    .sel(sel), 
    .in1(out[3]), 
    .in2(serial_in_right), 
    .in3(out[2]), 
    .in4(parallel_in[3]), 
    .out(mux_out[3]));
four_to_one_mux inst2( 
    .sel(sel), 
    .in1(out[2]), 
    .in2(out[3]), 
    .in3(out[1]), 
    .in4(parallel_in[2]), 
    .out(mux_out[2]));
four_to_one_mux inst1( 
    .sel(sel), 
    .in1(out[1]), 
    .in2(out[2]), 
    .in3(out[0]), 
    .in4(parallel_in[1]), 
    .out(mux_out[1]));
four_to_one_mux inst0( 
    .sel(sel), 
    .in1(out[0]), 
    .in2(out[1]), 
    .in3(serial_in_left), 
    .in4(parallel_in[0]), 
    .out(mux_out[0]));

always @(posedge clk) begin
    if (clear) begin
        out <= 4'b0000;
    end else begin
        out <= mux_out;
    end
end

endmodule
