//RTL Model for Linear Feedback Shift Register
module lfsr
#(parameter N = 4) // Number of bits for LFSR
(
  input logic clk, resetn, load_seed,
  input logic[N-1:0] seed_data,
  output logic[N-1:0] lfsr_data
);

logic [3:0] q;

//Sequential logic 
always @(posedge clk or posedge resetn) begin
    if(!resetn) begin
        lfsr_data <= 4'b0000;
    end else if (load_seed) begin
        lfsr_data <= seed_data;
    end else begin
        lfsr_data <= {lfsr_data[N-2:0],lfsr_data[N-1]^lfsr_data[N-2]};  
        //Left shifting all bits by 1 and adding XOR of first 2 MSB bits to LSB bit.
    end
end
    
endmodule: lfsr