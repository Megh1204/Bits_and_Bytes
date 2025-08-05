module alu 
    #(parameter N=1)
    ( opnd1,opnd2,operation,out);
    
    input wire [N-1:0] opnd1,opnd2;
    input wire [1:0] operation;
    output reg [N-1:0] out;
    
    always @(opnd1 or opnd2 or operation) begin
        case(operation)
            2'b00: out = opnd1 + opnd2;
            2'b01: out = opnd1 - opnd2;
            2'b10: out = opnd1 & opnd2;
            2'b11: out = opnd1 | opnd2;
            default: out = {N{1'bx}}; //N-bit unknown value
        endcase
    end
    
endmodule