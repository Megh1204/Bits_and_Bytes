`timescale 1ns / 1ps

module arbiter(
    input clk, 
    input reset, 
    input req1, //CPU1 trying to access shared memory 
    input req2, //CPU2 trying to access shared memory
    input req3, //CPU3 trying to access shared memory
    output reg [1:0] grant
    );
    
//Local paramaters and variable declaration
localparam [1:0] IDLE = 2'b00,
                 GNT1 = 2'b01,
                 GNT2 = 2'b10,
                 GNT3 = 2'b11;

//Current and next state variable declaration
reg [1:0] present_state, next_state;

//Sequential logic realizing FF's
always @(posedge clk) begin
    if(reset) begin
        present_state <= IDLE;
    end else begin  
        present_state <= next_state;
    end
end

//Comninational logic for next_state and output
always @(*) begin
    case(present_state) 
        IDLE: begin
                if(req1) //req1 gets the highest priority coming out of idle
                    next_state = GNT1;
                else if (req2) //req2 gets the highest priority when coming out of IDLE/reset state
                    next_state = GNT2; 
                else if (req3)
                    next_state = GNT3;
                else 
                    next_state = IDLE;
                grant = 2'b00;
        end
        GNT1: begin
                if(req1) //CPU1 will have the highest priority regardless
                    next_state = GNT1;
                else if (req2) //req2 gets the priority after req1 for further round robin pattern.
                    next_state = GNT2;  
                else if (req3) //This is only to begin the round robin pattern to come out of CPU1.
                    next_state = GNT3;
                else 
                    next_state = IDLE; //go back to IDLE when no CPU is accessing.
                grant = 2'b01;
        end
        GNT2: begin
                if(req1) //CPU1 will have the highest priority regardless.
                    next_state = GNT1;
                else if(req3) //CPU3 will get round robin priority since currently CPU2 is accessing.
                    next_state = GNT3;
                else if(req2) //Only if CPU3 is not accessing, CPU2 be able to access when in GNT2.
                    next_state = GNT2;
                else 
                    next_state = IDLE; //go back to IDLE when no CPU is accessing.
                grant = 2'b10;
        end
        GNT3: begin
                if(req1) //CPU1 will have the highest priority regardless 
                    next_state = GNT1;
                else if(req2) //CPU2 will get round robin priority since currently CPU3 is accessing.
                    next_state = GNT2;
                else if(req3) //Only if CPU2 is not accessing, CPU3 be able to access when in GNT3.
                    next_state = GNT3;
                else 
                    next_state = IDLE; //go back to IDLe when no CPU is accessing.
                grant = 2'b11;
        end
        default: begin
            next_state = IDLE; //go to idle in case of a bad state
            grant = 2'b00; //no CPU will access the memory in the default state.
        end
    endcase
end
                
endmodule
