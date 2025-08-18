`timescale 1ns / 1ps

//Level to Pulse Converter using Moore FSM

//Step1: Module Instantiation.
module level_to_pulse_converter(
    input clk, 
    input reset, 
    input data_in,
    output reg pulse
    );
    
//Step2: Local parameters for state encodings
localparam [1:0] IDLE = 2'b00,
                 PULSE = 2'b01,
                 LEVEL = 2'b10;
                 
//Step3: Present and next state variables
reg [1:0] present_state, next_state;

//Step4: Sequential Logic for synthesizing FF's
always @(posedge clk) begin 
    if (reset) begin 
        present_state <= IDLE;
    end else begin 
        present_state <= next_state;
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
                if(data_in) 
                    next_state = PULSE;
                else 
                    next_state = IDLE;
                pulse = 1'b0;
            end
            PULSE: begin
                if(data_in) 
                    next_state = LEVEL;
                else 
                    next_state = IDLE;
                pulse = 1'b1;
            end
            LEVEL: begin
                if(data_in) 
                    next_state = LEVEL;
                else 
                    next_state = IDLE;
                pulse = 1'b0;
            end
            default: begin
                next_state = IDLE;
                pulse = 1'b0;
            end
        endcase
    end
end
    
endmodule
