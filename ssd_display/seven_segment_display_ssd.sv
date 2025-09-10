`timescale 1ns / 1ps

module seven_segment_display_ssd(
    input [3:0] data, 
    output reg [6:0] segments
    );
    
    always_comb begin
        case(data) 
            4'b0000 : segments = 7'b111_1110; //abcdef
            4'b0001 : segments = 7'b011_0000; //bc
            4'b0010 : segments = 7'b110_1101; //abdeg
            4'b0011 : segments = 7'b111_1001; //abcdg
            4'b0100 : segments = 7'b011_0011; //bcfg
            4'b0101 : segments = 7'b101_1011; //acdfg
            4'b0110 : segments = 7'b101_1111; //acdefg
            4'b0111 : segments = 7'b111_0000; //abc
            4'b1000 : segments = 7'b111_1111; //abcdefg
            4'b1001 : segments = 7'b111_0011; //abcdfg
            default : segments = 7'b000_0000; //No display
        endcase
    end
endmodule
