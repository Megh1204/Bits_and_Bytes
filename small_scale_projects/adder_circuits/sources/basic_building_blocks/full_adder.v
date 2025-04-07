`timescale 1ns / 1ps

module full_adder(
    input A,
    input B, 
    input Cin, 
    output Sum,
    output Cout
    );
    
wire S;
    
half_adder inst1(.A(A), .B(B), .sum(S), .carry(C_ha1));
half_adder inst2(.A(S), .B(Cin), .sum(Sum), .carry(C_ha2));
assign Cout = C_ha1 | C_ha2;

endmodule