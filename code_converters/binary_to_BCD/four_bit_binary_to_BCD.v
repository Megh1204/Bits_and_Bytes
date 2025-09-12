`timescale 1ns / 1ps
/*

0000 - 0000_0000
0001 - 0000_0001
0010 - 0000_0010
0011 - 0000_0011
0100 - 0000_0100
0101 - 0000_0101
0110 - 0000_0110
0111 - 0000_0111
1000 - 0000_1000
1001 - 0000_1001      //If first 3 bits is less than or equal 4 --> BCD number is same as binary
1010 - 0001_0000   --> 1010 + 110 --> 10000
1011 - 0001_0001   --> 1011 + 110 --> 10001
1100 - 0001_0010   --> 1100 + 110 --> 10010
1101 - 0001_0011   --> 1101 + 110 --> 10011
1110 - 0001_0100   --> 1110 + 110 --> 10100
1111 - 0001_0101   --> 1111 + 110 --> 10101
//If first 3 bits is greater than 4 --> BCD number is number + 6.

*/

module four_bit_binary_to_BCD
    (
        input [3:0] binary_input,
        output[4:0] bcd_output
    );
    
    assign bcd_output = (binary_input[3:1] < 5) ? binary_input : binary_input + 3'b110;
    
endmodule
