module alu_top // Module start declaration
#(parameter N=4) // Parameter declaration
    (  
    input logic clk, reset,
    input logic[N-1:0]operand1, operand2,
    input logic[N-1:0] select,
    output logic[(2*N)-1:0] result
    );

    logic[(2*N)-1:0] alu_out; 

    alu #(.N(N)) alu_inst(
        .operand1(operand1),
        .operand2(operand2),
        .operation(select),
        .alu_out(alu_out)
        );  

  
    always@(posedge clk or posedge reset) begin
        if(reset == 1) begin
        result <= 0;
    end
    else begin
        result <= alu_out;
    end
  end
endmodule: alu_top 