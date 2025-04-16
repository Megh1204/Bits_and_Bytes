`timescale 1ns / 1ps

module overflow_counter(
    input clk_100MHz,
    input reset, 
    input enable,
    output [15:0] led,
    output [15:0] overflow_count_BCD
    );


reg [31:0] counter = 32'b0; 
reg [13:0] overflow_count_binary = 14'b0; 
//This will count the number of times counter will overflow. 
//This will be displayed on the SSD display of the Basys 3 FPGA board. 
//This can take decimal values from 0 to 9999.
//We will take the binary number and convert it to its BCD equivalent to display decimals.
//If the SSD display will overflow, we will make it back to zero.

binary_to_BCD_ssd_display inst(
    .binary(overflow_count_binary),
    .BCD(overflow_count_BCD)
); 


always @(posedge clk_100MHz) begin
    if(reset) begin 
        counter <= 32'b0;
    end else if(enable) begin
        counter <= counter + 1'b1;
    end else begin 
        counter <= counter;
    end
end

always @(posedge clk_100MHz) begin
    if(reset) begin
        overflow_count_binary <= 14'b0;
    end else if (counter == 32'hFFFF_FFFF) begin
        overflow_count_binary <= overflow_count_binary +1'b1;
    end else if (overflow_count_binary == 14'd9999 && counter == 32'hFFFF_FFFF) begin
        overflow_count_binary <= 14'b0;
    end else begin
        overflow_count_binary <= overflow_count_binary;
    end

end

assign led = counter[31:16];

endmodule
