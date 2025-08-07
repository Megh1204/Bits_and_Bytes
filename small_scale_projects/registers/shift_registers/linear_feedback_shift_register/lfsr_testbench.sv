`timescale 1ns/1ns
//LFSR Testbench Code
module lfsr_testbench;
  parameter N = 4;
  logic clock;
  logic [N-1:0] lfsr_data, seed_data;
  logic resetn, load_seed;
   
  lfsr #(.N(N)) design_inst(
   .clk(clock),
   .resetn(resetn),
   .load_seed(load_seed),
   .seed_data(seed_data),
   .lfsr_data(lfsr_data)
  );
  
  initial begin
   // Initialize Inputs
   resetn = 0;
   load_seed = 0;
   clock = 0;
   seed_data = 4'b0000;

   // Wait 10 ns for global reset to finish and start counter
   #10;
   resetn = 1;

   #10;
   load_seed = 1;
   seed_data = 4'b1111;

   #20;
   load_seed = 0;

   #200;
    
   // terminate simulation
   $finish();
  end

  // Clock generator logic
  always@(clock) begin
    #10ns clock <= !clock;
  end

  // Print input and output signals
  initial begin
   $monitor(" time=%0t,  resetn=%b  load_seed=%b  seed_data=%b lfsr_data=%d", $time, resetn, load_seed, seed_data, lfsr_data);
  end

endmodule