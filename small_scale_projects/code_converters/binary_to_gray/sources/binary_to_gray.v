`timescale 1ns / 1ps

module binary_to_gray #(parameter N = 4)(
    input [N-1:0] bin,
    output [N-1:0] gray
    );
   
genvar i;

    assign gray[N-1] = bin[N-1];
    for (i=0;i<N-1;i=i+1) begin
        assign gray[i] = bin[i] ^ bin[i+1];
    end

endmodule
