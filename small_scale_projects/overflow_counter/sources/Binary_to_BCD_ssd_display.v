`timescale 1ns / 1ps

module binary_to_BCD_ssd_display(
    input [13:0] binary,
    output reg [15:0] BCD
);


    
    reg [29:0] operation; //This value must be binary + BCD in length
    integer i;
    
    always @(*)
        begin
            operation = {16'h0000, binary}; 
            for (i=0; i<14; i=i+1) begin
                if (operation[17:14] > 4) operation[17:14] = operation[17:14] + 4'd3;
                if (operation[21:18] > 4) operation[21:18] = operation[21:18] + 4'd3;
                if (operation[25:22] > 4) operation[25:22] = operation[25:22] + 4'd3;
                if (operation[29:26] > 4) operation[29:26] = operation[29:26] + 4'd3;
                operation = operation << 1;
        end
        BCD = operation[29:14];
    end

endmodule