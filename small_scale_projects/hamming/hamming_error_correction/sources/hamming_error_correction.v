`timescale 1ns / 1ps

module hamming_error_correction(
    input [6:0] h_in,
    output reg [6:0] h_out
    );
    
wire [2:0] check;
//  h6    h5  h4     h3     h2      h1     h0
//  D7   D6   D5     P4     D3      p2     P1

assign check[0] = h_in[0]^h_in[2]^ h_in[4]^h_in[6];
assign check[1] = h_in[1]^h_in[2]^ h_in[5]^h_in[6];
assign check[2] = h_in[3]^h_in[4]^ h_in[5]^h_in[6];

always @(*) begin
    h_out = h_in;
    case (check)
        3'b000: h_out = h_in;
        3'b001: h_out[0] = ~h_in[0];
        3'b101: h_out[1] = ~h_in[1];
        3'b011: h_out[2] = ~h_in[2];
        3'b100: h_out[3] = ~h_in[3];
        3'b101: h_out[4] = ~h_in[4];
        3'b110: h_out[5] = ~h_in[5];
        3'b111: h_out[6] = ~h_in[6];
    endcase
end

endmodule
