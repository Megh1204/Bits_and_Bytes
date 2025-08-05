module alu_top
    #(parameter N = 1)
    (clk, resetn, operand1, operand2, operation, result);
    
    input clk;
    input reset;
    input [N-1:0] operand1, operand2;
    input [1:0] operation;
    output reg [N-1:0] result; 
    
    wire [N-1:0] alu_out;
    
    //Module Instantiation
    alu #(.N(N)) alu_inst(
        .opnd1(operand1),
        .opnd2(operand2),
        .operation(operation),
        .out(alu_out)
        );
        
    always @(posedge clk or negedge resetn) begin
        if(resetn==0) 
            result = {N{1'b0}};
        else 
            result = alu_out;
    end
endmodule