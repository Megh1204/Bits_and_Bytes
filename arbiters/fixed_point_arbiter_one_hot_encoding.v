`timescale 1ns / 1ps

//Module declaration
module fixed_point_arbiter_one_hot_encoding(
    input clk,
    input reset, 
    input [3:0] req,
    output reg [3:0] grant
    );

always @(posedge clk or posedge reset) begin
    if(reset) 
        grant = 4'b0000; //No CPU will get grant when reset
    else if (req[3])
        grant = 4'b1000; //CPU3 has highest priority
    else if (req[2]) 
        grant = 4'b0100; //CPU2 has next priority after CPU3
    else if (req[1]) 
        grant = 4'b0010; //CPU1 has next priority after CPU3 and CPU2.
    else if (req[0]) 
        grant = 4'b0001; //CPu0 has the least priority of all 4.
    else 
        grant = 4'b0000;
end

endmodule
