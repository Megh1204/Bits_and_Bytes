`timescale 1ns / 1ps

module timer(
    input clk_1Hz,
    input reset, 
    output reg [3:0] msb_hr,
    output reg [3:0] lsb_hr,
    output reg [3:0] msb_min,
    output reg [3:0] lsb_min,
    output reg [3:0] msb_sec,
    output reg [3:0] lsb_sec
    );
    
    always @(posedge clk_1Hz or posedge reset) begin
        if (reset) begin
            msb_hr <= 4'b0000;
            lsb_hr <= 4'b0000;
            msb_min <= 4'b0000;
            lsb_min <= 4'b0000;
            msb_sec <= 4'b0000;
            lsb_sec <= 4'b0000;
        end else begin
            // Seconds
            if (lsb_sec < 9) begin
                lsb_sec <= lsb_sec + 1'b1;
            end else begin
                lsb_sec <= 4'b0000;
                if (msb_sec < 5) begin
                    msb_sec <= msb_sec + 1'b1;
                end else begin
                    msb_sec <= 4'b0000;
                    
                    // Minutes
                    if (lsb_min < 9) begin
                        lsb_min <= lsb_min + 1'b1;
                    end else begin
                        lsb_min <= 4'b0000;
                        if (msb_min < 5) begin
                            msb_min <= msb_min + 1'b1;
                        end else begin
                            msb_min <= 4'b0000;
                            
                            // Hours
                            if (lsb_hr < 9) begin
                                lsb_hr <= lsb_hr + 1'b1;
                            end else begin
                                lsb_hr <= 4'b0000;
                                if (msb_hr < 2 || (msb_hr == 2 && lsb_hr < 3)) begin
                                    msb_hr <= msb_hr + 1'b1;
                                end else begin
                                    // Reset to 00:00:00 after 23:59:59
                                    msb_hr <= 4'b0000;
                                    lsb_hr <= 4'b0000;
                                end
                            end
                        end
                    end
                end
            end
        end
    end

endmodule
