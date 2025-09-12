`timescale 1ns / 1ps

module top_module(
    input clk_100MHz,
    input reset,
    input enable,
    output[15:0] led,
    output [3:0] digit_selector,
    output [6:0] displayer
    );
    
wire [15:0] overflow_count_BCD;

overflow_counter counter_inst(
    .clk_100MHz(clk_100MHz),
    .reset(reset), 
    .enable(enable),
    .led(led),
    .overflow_count_BCD(overflow_count_BCD)
    );

wire [3:0] digit_selector;
anode_selector selector_inst(
    .clk_100MHz(clk_100MHz),
    .reset(reset),
    .digit(digit_selector)      // digit select signals
    );
    
reg [3:0] in;
always @(*) begin
    case(digit_selector)
        4'b1110: in = overflow_count_BCD[3:0];
        4'b1101: in = overflow_count_BCD[7:4];
        4'b1011: in = overflow_count_BCD[11:8];
        4'b0111: in = overflow_count_BCD[15:12];
    endcase
end

ssd_display display_inst(
    .in(in),
    .disp(displayer)
    );


endmodule


