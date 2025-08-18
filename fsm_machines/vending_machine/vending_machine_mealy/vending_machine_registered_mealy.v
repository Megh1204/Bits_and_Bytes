`timescale 1ns / 1ps

//Step1: Module declaration
module vending_machine_mealy(
    input clk,
    input reset, 
    input nickel, 
    input dime, 
    output reg open
    );
    
//Step2: Local parameter declarations for state encodings
localparam [1:0] IDLE = 2'b00,
                 CENTS_5 = 2'b01,
                 CENTS_10 = 2'b11;
                 
//Step3: Present and next state variable declaration
reg [1:0] present_state, next_state;
reg r_dime, r_nickel; //Registering the inputs to avoid typical mealy glitches. 

//Step4: Sequential logic module
always @(posedge clk) begin
    if(reset) begin
        present_state <= IDLE;
        r_dime <= 1'b0;
        r_nickel <= 1'b0;
    end else begin 
        present_state <= next_state;
        r_dime <= dime;
        r_nickel <= nickel;
    end
end

//Step5: Combinational logic module with auto reset
always @(*) begin
    if(reset) begin
        next_state = IDLE;
        open = 1'b0;
    end else begin
        case(present_state)
            IDLE: begin
                if(r_dime) begin
                    next_state = CENTS_10;
                    open = 1'b0;
                end else if(r_nickel) begin
                    next_state = CENTS_5;
                    open = 1'b0;
                end else begin 
                    next_state = IDLE;
                    open = 1'b0;
                end
            end
            CENTS_5: begin
                if(r_dime) begin
                    next_state = IDLE;
                    open = 1'b1;
                end else if(r_nickel) begin
                    next_state = CENTS_10;
                    open = 1'b0;
                end else begin 
                    next_state = CENTS_5;
                    open = 1'b0;
                end
            end
            CENTS_10: begin
                if(r_dime) begin
                    next_state = IDLE;
                    open = 1'b1;
                end else if(r_nickel) begin
                    next_state = IDLE;
                    open = 1'b1;
                end else begin 
                    next_state = CENTS_10;
                    open = 1'b0;
                end
            end
            default: begin
                next_state = IDLE;
                open = 1'b0;
            end
        endcase
    end
end
    
    
endmodule
