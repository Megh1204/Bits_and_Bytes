`timescale 1ns / 1ps

module binary_to_BCD    #(
    parameter bin = 4, //Assume that the binary digit is 4-bit representing values from 0 to 15.
    parameter bcd = 8  //15 needs to be represented in bcd with atleast 8-bits.
    )(
    input reset,
    input [bin-1:0] binary,
    output reg [bcd-1:0] BCD
);

    /*The width of Binary and BCD can be adjusted accordingly based 
    on the requirements but I took 4-bit binary for simplicity*/
    
    /*Lets say for example: 
    You want to convert a 8-bit binary to BCD, 
    Their corresponding decimal numbers go all the way from 0 to 255. 
    255 requires 12-bits to be represented in BCD. 
    So, BCD must be atleast 12-bits wide*/
    
    reg [(bin+bcd)-1:0] operation; //This value must be binary + BCD in length
    integer i;
    
    always @(*) begin
        if (reset == 1) begin
            BCD = 8'b0;
            operation = {8'B0000_0000, binary}; 
        end
        else begin
            BCD = 8'b0;
            operation = {8'b0000_0000, binary}; 
            for (i=0; i<bin; i=i+1) begin
                if (operation[7:4] >= 5) operation[7:4] = operation[7:4] + 2'd3;
                if (operation[11:8] >= 5) operation[11:8] = operation[11:8] + 2'd3;
                operation = operation << 1;
            end
        end
        BCD = operation[(bcd+bin)-1:bin];
    end

endmodule
