`timescale 1ns / 1ps

module sync_fifo
    #(parameter datawidth = 8, depth = 8)
    (
        input clk, 
        input reset, 
        input rd_en,
        input wr_en,
        input [datawidth-1:0] din,
        output reg [datawidth-1:0] dout,
        output empty,
        output full
    );
    
    localparam addrwidth = $clog2(depth);
    
    //Both read and write pointers have an additional wrap around bit. 
    reg [addrwidth:0] rd_ptr;
    reg [addrwidth:0] wr_ptr;
    
    reg [datawidth-1:0] fifo [depth-1:0];
    
    //Sequential logic for write operations
    always @(posedge clk) begin
        if(reset) begin
            wr_ptr <= 0;
        end else begin
            if(wr_en && !full) begin
                fifo[wr_ptr[addrwidth-1:0]] <= din;
                wr_ptr <= wr_ptr + 1;
            end
        end
    end
    
    //Sequential logic for read operations
    always @(posedge clk) begin
        if(reset) begin
            rd_ptr <= 0;
        end else begin
            if(rd_en && !empty) begin
                dout <= fifo[rd_ptr[addrwidth-1:0]];
                rd_ptr <= rd_ptr + 1;
            end
        end
    end
    
    assign empty = (rd_ptr == wr_ptr) ? 1'b1 : 1'b0;
    assign full = (rd_ptr[addrwidth] != wr_ptr[addrwidth]) && 
           (rd_ptr[addrwidth-1:0] == wr_ptr[addrwidth-1:0]) ? 1'b1 : 1'b0; 
    
endmodule
