`timescale 1ns / 1ps

//Module Instantiation
module round_robin_arbiter_variable_time_slices
    #(parameter cycles = 4)  //Round robin arbiter with 4 cycles of priority for each CPU
    (
    input clk, 
    input reset, 
    input req1, //CPU1 trying to access memory
    input req2, //CPU2 trying to access memory
    input req3, //CPU3 trying to access memory 
    output reg [1:0] grant
    );
    
//Local parameters and variables declaration for state encodings
localparam [1:0] IDLE = 2'b00, //No CPU will get priority
                 GNT1 = 2'b01, //CPU1 will get priority
                 GNT2 = 2'b10, //CPU2 will get priority
                 GNT3 = 2'b11; //CPU3 will get priority

//Local parameter declaration for varaible count logic                 
localparam count_width = $clog2(cycles); //for cycles = 4, countwidth = 2 counting 0,1,2 and 3. 
reg [count_width-1:0] count; //2 bit counter to count 0,1,2 and 3

//Present and next state variables
reg [1:0] present_state, next_state;

//Squential logic realizing FF's
always @(posedge clk) begin
    if(reset) begin
        present_state <= IDLE;
    end else begin
        present_state <= next_state;
    end
end

//Combinational logic
always @(*) begin
    case(present_state) 
        IDLE: begin
                count = {count_width{1'b0}};
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
                if((!req1&& req2) || (req2 && count > cycles-2)) begin      //Next CPU will get highest priority
                    next_state = GNT2;
                    count = {count_width{1'b0}};
                end else if((!req1 && req3) || (req3 && count > cycles-2)) begin
                    next_state = GNT3;
                    count = {count_width{1'b0}};
                end else if(req1) begin         //CPU1 gets least priority since already in GNT1
                    next_state = GNT1;
                    count = count + 1'b1;
                end else begin                  //Goes to IDLE when no CPU is requesting
                    next_state = IDLE;
                    count = {count_width{1'b0}};
                end
                grant = 2'b01; //Output encoding for CPU1 getting access
        end
        GNT2: begin
                if((!req2 && req3) || (req3 && count > cycles-2)) begin      //Next CPU will get highest priority
                    next_state = GNT3;
                    count = {count_width{1'b0}};
                end else if((!req2 && req1) || (req1 && count > cycles-2)) begin
                    next_state = GNT1;
                    count = {count_width{1'b0}};
                end else if(req2) begin      //CPU2 gets least priority since already in GNT2
                    next_state = GNT2;
                    count = count + 1'b1;
                end else  begin                 //Goes to IDLE when no CPU is requesting
                    next_state = IDLE;
                    count = {count_width{1'b0}};
                end
                grant = 2'b10; //Output encoding for CPU1 getting access
        end
        GNT3: begin
                if((!req3 && req1) || (req1 && count > cycles-2)) begin   //Next CPU will get highest priority
                    next_state = GNT1;
                    count = {count_width{1'b0}};
                end else if((!req3 && req2) || (req2 && count > cycles-2)) begin
                    next_state = GNT2;
                    count = {count_width{1'b0}};
                end else if(req3) begin       //CPU3 gets least priority since already in GNT3
                    next_state = GNT3;
                    count = count + 1'b1;
                end else begin                   //Goes to IDLE when no CPU is requesting
                    next_state = IDLE;
                    count = {count_width{1'b0}};
                end
                grant = 2'b11; //Output encoding for CPU1 getting access
        end
        default: begin
            count = {count_width{1'b0}};
            next_state = IDLE; //Goes to idle state
            grant = 2'b00;   //Output encoding for no CPU accessing
        end
    endcase
end 
       
endmodule
