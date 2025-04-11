`timescale 1ns / 1ps

/*
In this verilog code, we will design a sequence detector with Mealy Machine 
along with overlap.

Detailed Steps to write the verilog code for any Finite State Machine: 
--> STEP1 :- Write module definitions (inputs and outputs).
--> STEP2 :- Define the parameters for FSM stste encodings.
--> STEP3 :- Define the current state and the next state variables
--> STEP4 :- Write the sequenctial logic for present state.
--> STEP5 :- Write the combinational logic for next state and output.
*/

//STEP1 :- Write module definitions (inputs and outputs).
module sequence_detector_mealy_overlap(
    input clk,
    input reset,
    input in,
    output reg out
    );
    
//STEP2 :- Define the parameters for FSM state encodings
localparam [1:0] S0 = 2'b00,
                 S1 = 2'b01,
                 S2 = 2'b10;
             
//STEP3 :- Define the current state and next state variables
logic [1:0] present_state;
logic [1:0] next_state;
    
//STEP4 :- Write the sequential logic for present state
always @(posedge clk) begin
    if(reset)
        present_state <= S0;
    else 
        present_state <= next_state;
end

//STEP5 :- Combinational Logic for Next State and Output
always @(present_state, in) begin
    case(present_state)
        S0: begin
            if(in==1) begin 
                next_state = S1;
                out = 0;
            end else begin
                next_state = S0;
                out = 0;
            end
        end
        S1: begin
            if(in==1) begin
                next_state = S2;
                out = 0;
            end else begin
                next_state = S0;
                out = 0;
            end
        end
        S2: begin
            if(in==1) begin 
                next_state = S2;
                out = 1;
            end else begin
                next_state = S0; 
                out = 0;       
            end
        end
        default: begin
            out = 0;
            next_state = S0;
        end
    endcase
end

endmodule
    