module sram
    #(parameter datawidth = 8, addrwidth = 8)
    (
    input clk, //synchronous write but asynchronous read
    input reset, //When reset all the memory will be initialized to 0.
    input wr_en, //if wr_en = 1, write or else we_en = 0, read
    input [addrwidth-1:0] addr,
    input [datawidth-1:0] din,
    output [datawidth-1:0] dout
    );
    
    //Memory Array
    reg [datawidth-1:0] mem [2**addrwidth-1:0];
    
    integer i;
    
    //Synchronous sequential part
    always @(posedge clk) begin
        if (wr_en) begin
            mem[addr] <= din;
        end
    end
    
    //Asynchronous comb part
    always @(*) begin
        if(reset) begin //When reset, immediately initialize all the memory bits to 0.
            for (i=0;i<(2**addrwidth);i=i+1) begin
                mem[i] = {datawidth{1'b0}};
            end
        end
    end
    
    assign dout = mem[addr];
    

endmodule
    