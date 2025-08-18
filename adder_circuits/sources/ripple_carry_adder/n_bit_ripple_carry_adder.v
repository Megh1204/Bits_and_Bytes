`timescale 1ns / 1ps

module n_bit_ripple_carry_adder #(parameter N = 4)
    (
    input [N-1:0] A,
    input [N-1:0] B, 
    output [N:0] Sum
    );
    
wire [N-1:0] carry;
    
    

genvar i;
generate
    for (i=0; i<N; i=i+1) begin
        if(i==0) begin
            full_adder inst0(.A(A[i]), .B(B[i]), .Cin(i), .Sum(Sum[i]), .Cout(carry[i]));    //The very first FA instance's Cin will be zero.
        end else begin
            full_adder inst(.A(A[i]), .B(B[i]), .Cin(carry[i-1]), .Sum(Sum[i]), .Cout(carry[i]));    //Cin[n] = Cout[n-1] for remaining FA instances.
        end
    end
endgenerate 
assign Sum[N] = carry[N-1];
    
endmodule