`timescale 1ns / 1ps

module ripple_counter(
    input clk, 
    input rstn,
    output [3:0] out
    );
    
    //Outputs of FF's 1,2,3 and 4.
    wire q1;
    wire q2;
    wire q3;
    wire q4;
    
    //Negated outputs of FF's 1,2,3 and 4. 
    wire qn1;
    wire qn2;
    wire qn3;
    wire qn4;

    dff inst1(.clk(clk),.rstn(rstn),.d(qn1),.q(q1),.qn(qn1));
    dff inst2(.clk(q1),.rstn(rstn),.d(qn2),.q(q2),.qn(qn2));
    dff inst3(.clk(q2),.rstn(rstn),.d(qn3),.q(q3),.qn(qn3));
    dff inst4(.clk(q3),.rstn(rstn),.d(qn4),.q(q4),.qn(qn4));
    
    assign out = {qn4,qn3,qn2,qn1};
    
endmodule
