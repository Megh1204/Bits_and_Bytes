//Simple Dual Port SRAM that is capable of simultaneous read and write
//A single clock is used for writing. (Synchronous write, Asynchronous read)

module dual_port_ram 
	#(parameter datawidth = 8, 
	  parameter addrwidth = 8)
	(
		input wr_clk, 
		input reset, 
		input wr_en,
		input rd_en,
		input [addrwidth-1:0] write_addr,
		input [addrwidth-1:0] read_addr,
		input [datawidth-1:0] write_data,
		input [datawidth-1:0] read_data
	);

	//Local variable declarations: 
	integer i;

	//Memory Array
	reg [datawidth-1:0] mem [2**addrwidth-1:0];

	//Synchronous write 
	always @(posedge wr_clk) begin
		if(reset) begin
			for (i=0;i<(2**addrwidth);i=i+1) begin
				mem[i] <= {datawidth{1'b0}};
			end
		end else if (wr_en) begin
			mem[write_addr] <= write_data;
		end
	end

assign read_data = (rd_en == 1) ? mem[read_addr] : {datawidth{1'b0}};

endmodule
