`timescale 1ns / 1ps

module top_module(
    input clk_100MHz,
    input reset,
    output [3:0] digit_selector,
    output [6:0] displayer
    );

    wire [3:0] msb_min;
    wire [3:0] lsb_min;
    wire [3:0] msb_sec;
    wire [3:0] lsb_sec;
    
    wire clk_1Hz;
    
    timer timer_inst(
        .clk_1Hz(clk_1Hz),
        .reset(reset),
        .msb_min(msb_min),
        .lsb_min(lsb_min),
        .msb_sec(msb_sec),
        .lsb_sec(lsb_sec));
        
        
        
    anode_selector selector_inst(
        .clk_100MHz(clk_100MHz),
        .reset(reset),
        .digit(digit_selector)      // digit select signals
    );
    
    
    //Module to divide 100Mhz clock to 1Hz clock.
    clk_div_1hz clk_div_inst(
    .clk_100MHz(clk_100MHz),
    .reset(reset),
    .clk_1Hz(clk_1Hz)
    );
        
        
reg [3:0] in;
always @(*) begin
    case(digit_selector)
        4'b1110: in = lsb_sec;
        4'b1101: in = msb_sec;
        4'b1011: in = lsb_min;
        4'b0111: in = msb_min;
    endcase
end

ssd_display display_inst(
    .in(in),
    .disp(displayer)
    );

endmodule



