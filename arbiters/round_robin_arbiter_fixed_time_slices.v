`timescale 1ns / 1ps

//Module Instantiation
module round_robin_arbiter_fixed_time_slices(
    input clk, 
    input reset, 
    input req1, //CPU1 trying to access memory
    input req2, //CPU2 trying to access memory
    input req3, //CPU3 trying to access memory 
    output reg [1:0] grant
    );
    
//Local parameters and variables declaration
localparam [1:0] IDLE = 2'b00, //No CPU will get priority
                 GNT1 = 2'b01, //CPU1 will get priority
                 GNT2 = 2'b10, //CPU2 will get priority
                 GNT3 = 2'b11; //CPU3 will get priority

//Present and next state variables
reg [1:0] present_state, next_state;

//Squential logic realizing FF's
always @(posedge clk) begin
    if(reset) 
        present_state <= IDLE;
    else 
        present_state <= next_state;
end

//Combinational logic
always @(*) begin
    case(present_state) 
        IDLE: begin
                if(req1)                //CPU1 gets priority once it comes out of idle
                    next_state = GNT1;
                else if(req2) 
                    next_state = GNT2;
                else if(req3)
                    next_state = GNT3;
                else                   //Stays in IDLE if no request is asserted
                    next_state = IDLE; 
                grant = 2'b00; //Output encoding for no CPU getting access. 
        end
        GNT1: begin
                if(req2)               //Next CPU will get highest priority
                    next_state = GNT2;
                else if(req3) 
                    next_state = GNT3;
                else if(req1)          //CPU1 gets least priority since already in GNT1
                    next_state = GNT1;
                else                   //Goes to IDLE when no CPU is requesting
                    next_state = IDLE;
                grant = 2'b01; //Output encoding for CPU1 getting access
        end
        GNT2: begin
                if(req3)               //Next CPU will get highest priority
                    next_state = GNT3;
                else if(req1) 
                    next_state = GNT1;
                else if(req2)          //CPU2 gets least priority since already in GNT2
                    next_state = GNT2;
                else                   //Goes to IDLE when no CPU is requesting
                    next_state = IDLE;
                grant = 2'b10; //Output encoding for CPU1 getting access
        end
        GNT3: begin
                if(req1)               //Next CPU will get highest priority
                    next_state = GNT1;
                else if(req2) 
                    next_state = GNT2;
                else if(req3)          //CPU3 gets least priority since already in GNT3
                    next_state = GNT3;
                else                   //Goes to IDLE when no CPU is requesting
                    next_state = IDLE;
                grant = 2'b11; //Output encoding for CPU1 getting access
        end
        default: begin
            next_state = IDLE; //Goes to idle state
            grant = 2'b00;   //Output encoding for no CPU accessing
        end
    endcase
end 
       
endmodule
