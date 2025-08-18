`timescale 1ns / 1ps

//Level to Pulse Converter using Mealy FSM but with registered inputs

//Step1: Module Instantiation.
module level_to_pulse_converter(
    input clk, 
    input reset, 
    input data_in,
    output reg pulse
    );
    
//Step2: Local parameters for state encodings
localparam IDLE = 1'b0,
           PULSE = 1'b1;
                 
//Step3: Present and next state variables
reg reg_data;
reg present_state, next_state;

//Step4: Sequential Logic for synthesizing FF's
always @(posedge clk) begin 
    if (reset) begin 
        present_state <= IDLE;
        reg_data <= 1'b0;
    end else begin 
        present_state <= next_state;
        reg_data <= data_in;
    end
end

//Step5: Combinational logic for synthesizing the logic for next state and output. 

always @(*) begin 
    if(reset) begin
        next_state = IDLE;
        pulse = 1'b0;
    end else begin
        case(present_state)
            IDLE: begin
                if(reg_data) begin
                    next_state = PULSE;
                    pulse = 1'b1;
                end else begin 
                    next_state = IDLE;
                    pulse = 1'b0;
                end
            end
            PULSE: begin
                if(reg_data) begin
                    next_state = PULSE;
                    pulse = 1'b0;
                end else begin 
                    next_state = IDLE;
                    pulse = 1'b0;
                end
            end
            default: begin
                next_state = IDLE;
                pulse = 1'b0;
            end
        endcase
    end
end
    
endmodule
