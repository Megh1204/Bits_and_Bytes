`timescale 1ns / 1ps
//One bit full adder using generate and propagate. 

module full_adder_pg(
    input a,b,cin, 
    output sum, cout
    );
    
    assign p = a^b;
    assign g = a&b;
    
    assign sum = p^cin;
    assign cout = g | p&cin;
    
endmodule
