`timescale 1ns / 1ps

module ssd_display(
    input [3:0] in,
    output reg [6:0]disp
    );

always @(in) begin
    case (in)
        4'b0000: disp = 7'b0000001;     //0
        4'b0001: disp = 7'b1001111;     //1
        4'b0010: disp = 7'b0010010;     //2
        4'b0011: disp = 7'b0000110;     //3
        4'b0100: disp = 7'b1001100;     //4
        4'b0101: disp = 7'b0100100;     //5
        4'b0110: disp = 7'b0100000;     //6
        4'b0111: disp = 7'b0001111;     //7
        4'b1000: disp = 7'b0000000;     //8
        4'b1001: disp = 7'b0000100;     //9
        default: disp = 7'b1111111;     //display nothing 
    endcase
end

endmodule
