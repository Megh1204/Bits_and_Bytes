`timescale 1ns / 1ps

/*
For all of the 4-different types of the sequence detector codes 
(Moore and Mealy with and without overlap), we have used two-always blocks:
1. For the sequential logic of present state. 
2. For the combinational logic of next state and output.

In this verilog code, we will design/implement the same 
sequence detector using a 1-always block approach. 
(without having to use two different always blocks). 
Example: Let's try to implement the Moore with overlap logic

Detailed Steps to write the verilog code for any Finite State Machine: 
--> STEP1 :- Write module definitions (inputs and outputs).
--> STEP2 :- Define the parameters for FSM stste encodings.
--> STEP3 :- Define the current state and the next state variables. 
             For 1-always block, we only need one state variable.
--> STEP4&5 combined :- Write the sequenctial logic for present state 
            and the combinational logic for next state and output.
*/

//MOORE 111 sequence detector with Overlap
//STEP1 :- Write module definitions (inputs and outputs).
module sequence_detector_1alwaysblock(
    input clk, 
    input reset, 
    input in, 
    output reg out
    );
       
//STEP2 :- Define the parameters for FSM state encodings
localparam [1:0] S0 = 2'b00,
                 S1 = 2'b01,
                 S2 = 2'b10,
                 S3 = 2'b11;
                 
//STEP3 :- Define the current state and next state variables
logic [1:0] state; //Do not need two separate state variables like 2always block approach
  
//STEP4&5 :- Writing both sequential logic and combinational logic 
//           in the same clocked always block
always@(posedge clk) begin  //Inputs are no longer asynchronously sampled.
//Change in input is captured with respect to a clock edge event
    if (reset == 1) begin
        state <= S0;
        out <= 0;
    end 
    else
        case(state) 
            S0: begin
                if(in==1) state <= S1; //use of non-blocking assignments,
                else state <= S0;      //because state updates every clock cycle.
                out <= 0;
            end
            S1: begin
                if(in==1) state <= S2;
                else state <= S0;
                out <= 0;
            end
            S2: begin
                if(in==1) state <= S3;
                else state <= S0;
                out <= 0;
            end
            S3: begin
                if(in==1) state <= S3;
                else state <= S0;
                out <= 1;    
                /*output will stay asserted longer even when the state 
                  has transitioned to another state where output should have
                  gone back to reset or some other value*/
            end 
            default: begin
                state <= S0;
                out <= 0;
            end           
        endcase
end

endmodule