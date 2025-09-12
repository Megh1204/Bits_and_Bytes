`timescale 1ns / 1ps


module tb();

localparam input_width = 4;

reg [input_width-1:0] binary_input;
wire [(2**input_width)-1:0] onehot_output;

binary_to_onehot
    #(.input_width(input_width)) dut_inst(
        .binary_input(binary_input), 
        .onehot_output(onehot_output)
    );
    
    initial begin
        binary_input = 4'b0000;
        repeat(17) begin
            #20
            binary_input = binary_input + 1'b1;
        end
        #50;
        $stop;
    end
        
    
endmodule
