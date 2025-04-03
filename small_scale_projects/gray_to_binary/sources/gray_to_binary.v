`timescale 1ns / 1ps

module gray_to_binary #(parameter N=4)
    (
    input [N-1:0] gray,
    output [N-1:0] bin
    );
    
assign bin[N-1] = gray[N-1];
genvar i;

for (i=N-2;i>-1; i=i-1) begin
    assign bin[i] = bin[i+1] ^ gray[i];
end
    
endmodule
