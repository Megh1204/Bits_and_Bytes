module clk_div_1hz(
    input clk_100MHz,
    input reset,
    output reg clk_1Hz
);
    reg [26:0] counter;  // 27-bit counter

    always @(posedge clk_100MHz or posedge reset) begin
        if (reset) begin
            counter <= 27'd0;
            clk_1Hz <= 1'b0;
        end else begin
            if (counter == 27'd49_999_999) begin
                counter <= 27'd0;
                clk_1Hz <= ~clk_1Hz;  // toggle every 50M cycles
            end else begin
                counter <= counter + 1'b1;
            end
        end
    end
endmodule
