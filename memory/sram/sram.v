`timescale 1ns / 1ps

module sram
    #(parameter datawidth = 8, addrwidth = 8)
    (
    input clk, //Clock allows for Synchronous write and read operations
    input reset, //When reset all the values will initialize to zero.
    input ce, //read and write operations are only possible when chip is enable
    input wr_en,  //If wr_en = 1 --> write operation else if wr_en = 0 read operation
    input [addrwidth:0] addr,
    input [datawidth-1:0] din,
    output reg [datawidth-1:0] dout
    );
    
    //Declare the memory arry
    reg [datawidth-1:0] mem [(2**addrwidth)-1:0];
    
    integer i;
    
    always @(posedge clk) begin
        if(reset) begin
        //Reset will initialize all memory locations to 8'b0000_0000;
            for(i=0;i<256;i=i+1) begin
                mem[i] = {datawidth{1'b0}};
            end
            dout <= {datawidth{1'b0}}; //When reset, data out is also 0.
        end else begin
            if(ce) begin
                if (wr_en) begin
                    mem[addr] <= din; //If not reset, we will write into memory when write enable in the address.
                    dout = {datawidth{1'b0}}; //data read undefined during write operation, hence can be set to 0.
                end else 
                    dout = mem[addr]; //I want to read when write enable is 0. 
            end
        end
    end
endmodule
