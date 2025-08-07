`timescale 1ns/1ps
module universal_shift_register (
    input logic clk,
    input logic reset,
    input logic load,
    input logic [2:0] shift_mode, //signal that determines the style of Shift Operation
    input logic sin,        //serial input
    input logic [3:0] din,  //parallel input
    output logic sout,      //serial output
    output logic [3:0] dout //parallel output
    );
    
    logic [3:0] shift_reg; //Temporary register used to store shift values
    
    //Sequential logic for shift reg
    always_ff @(posedge clk or posedge reset) begin
        if(reset) begin
            shift_reg <= 4'b0000;
        end 
        else if(load) begin
            shift_reg <= din;
        end
        else begin
            case(shift_mode)
                3'b000: //PIPO (Parallel In Parallel Out)
                        shift_reg <= shift_reg;
                3'b001: //SIPO-L (Left Shift Serial In Parallel Out)
                        shift_reg <= {shift_reg[2:0], sin};
                3'b010: //SIPO-R (Right Shift Serial In Parallel Out)
                        shift_reg <= {sin , shift_reg[3:1]}; 
                3'b011: //PISO-L (Parellel In Left Shift Serial Out)
                        shift_reg <= {shift_reg[2:0], 1'b0};
                3'b100: //PISO-R (Parallel In Right Shift Serial Out)
                        shift_reg <= {1'b0, shift_reg[3:1]};
                3'b101: //SISO-L (Left Shift Serial In Left Shift Serial Out)
                        shift_reg <= {shift_reg[2:0], sin};
                3'b110: //SISO-R (Right Shift Serial In Right Shift Serial Out)
                        shift_reg <= {sin , shift_reg[3:1]}; 
                default: shift_reg <= shift_reg;
            endcase
        end
    end
        
    //Combinational logic for dout and sout
    always_comb begin
        if (reset) begin
            sout = 1'b0;
            dout = 4'b0000;
        end else begin
            case(shift_mode)
                3'b000: //PIPO (Parallel In Parallel Out)
                        begin sout = 1'b0; dout[3:0] = din[3:0]; end
                3'b001: //SIPO-L (Left Shift Serial In Parallel Out)
                        begin sout = 1'b0; dout = shift_reg[3:0]; end
                3'b010: //SIPO-R (Right Shift Serial In Parallel Out)
                        begin sout = 1'b0; dout = shift_reg[3:0]; end 
                3'b011: //PISO-L (Parellel In Left Shift Serial Out)
                        begin sout = shift_reg[3]; dout = 4'b0000; end
                3'b100: //PISO-R (Parallel In Right Shift Serial Out)
                        begin sout = shift_reg[0]; dout = 4'b0000; end
                3'b101: //SISO-L (Left Shift Serial In Left Shift Serial Out)
                        begin sout = shift_reg[3]; dout = 4'b0000; end
                3'b110: //SISO-R (Right Shift Serial In Right Shift Serial Out)
                        begin sout = shift_reg[0]; dout = 4'b0000; end
                default: begin sout = 1'b0; dout = 4'b0000; end                 
            endcase
        end
    end
    
endmodule
    