module alu // Module start declaration
#(parameter N=4) // Parameter declaration
(
    input logic[N-1:0] operand1, operand2,
    input logic[N-1:0] operation,
    output logic[(2*N)-1:0] alu_out
);

    always@(operand1 or operand2 or operation) 
        begin
            case(operation)
                4'b0000: alu_out = operand1 + operand2;  //Addition
                4'b0001: alu_out = operand1 - operand2;  //Subtraction
                4'b0010: alu_out = operand1 * operand2;  //MUltiplication
                4'b0011: alu_out = (operand2 != 0) ? (operand1 % operand2) : 1'bx;  //Modulo
                4'b0100: alu_out = (operand2 != 0) ? (operand1 / operand2) : 1'bx;  //Division
                4'b0101: alu_out = operand1 & operand2;  //Bitwise AND
                4'b0110: alu_out = operand1 | operand2;  //Bitwise OR
                4'b0111: alu_out = operand1 ^ operand2;  //Bitwise XOR
                4'b1000: alu_out = operand1 && operand2;  //Logical AND
                4'b1001: alu_out = operand1 || operand2;  //Logical OR
                4'b1010: alu_out = operand1 << 1;  //Left shift by 1
                4'b1011: alu_out = operand1 >> 1;  //Right shift by 1
                4'b1100: alu_out = operand1 == operand2;  //Logical Equality
                4'b1101: alu_out = operand1 != operand2;  //Logical Inequality
                4'b1110: alu_out = operand1 < operand2;  //Less than comparision
                4'b1111: alu_out = operand1 > operand2; //Greater than comparison
            endcase
        end
endmodule: alu

