`timescale 1ns / 1ps

//Step1: Module declaration
module vending_machine_moore(
    input clk, 
    input reset, 
    input nickel, 
    input dime, 
    output reg open
    );
    
//Step2: State encodings
localparam [1:0] IDLE = 2'b00,
                 CENTS_5 = 2'b01, 
                 CENTS_10 = 2'b11,
                 CENTS_15 = 2'b10;
                 
//Step3: Present and next state variable declaration. 
reg [1:0] present_state, next_state;

//Step4: Sequential logic to generate flops
always @(posedge clk) begin 
    if(reset) begin
        present_state <= IDLE;
    end else begin
        present_state <= next_state;
    end
end

//Step5: Combinational logic for next state and output 
always @(*) begin
    if(reset) begin
        next_state = IDLE;
        open = 1'b0;
    end else begin
        case(present_state) 
            IDLE : begin
                if(dime) 
                    next_state = CENTS_10;
                else if (nickel) 
                    next_state = CENTS_5;
                else 
                    next_state = IDLE;
                open = 1'b0;
            end
            CENTS_5 : begin
                if(dime) 
                    next_state = CENTS_15;
                else if (nickel) 
                    next_state = CENTS_10;
                else 
                    next_state = CENTS_5;
                open = 1'b0;
            end
            CENTS_10 : begin
                if(dime) 
                    next_state = CENTS_15;
                else if (nickel) 
                    next_state = CENTS_15;
                else 
                    next_state = CENTS_10;
                open = 1'b0;
            end
            CENTS_15 : begin
                //Activate either of the two next_state statements depending on auto or manual reset
                //next_state = CENTS_15; //Manual reset
                next_state = IDLE; //For auto reset
                open = 1'b1;
            end
            default: begin
                next_state = IDLE;
                open = 1'b0;
            end 
        endcase
    end
end
    
endmodule
