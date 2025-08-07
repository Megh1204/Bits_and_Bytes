// Barrel Shifter RTL Model
module barrel_shifter (
  input logic select,  // select=0 shift operation, select=1 rotate operation
  input logic direction, // direction=0 right move, direction=1 left move
  input logic[1:0] shift_value, // number of bits to be shifted (0, 1, 2 or 3)
  input logic[3:0] din,
  output logic[3:0] dout
);

    always_comb begin
        if (select == 0) begin
            if(direction == 0) begin 
                //Shift right
                case(shift_value)
                    2'b00: dout = din;
                    2'b01: dout = dout >> 1;
                    2'b10: dout = dout >> 2;
                    2'b11: dout = dout >> 3;
                endcase
            end else begin
                //Shift Left
                case(shift_value)
                    2'b00: dout = din;
                    2'b01: dout = dout << 1;
                    2'b10: dout = dout << 2;
                    2'b11: dout = dout << 3;
                endcase
            end           
        end else begin
            if(direction == 0) begin 
                //Rotate right (clockwise)
                case(shift_value)
                    2'b00: dout = din;
                    2'b01: dout = {din[2:0],din[3]};
                    2'b10: dout = {din[1:0],din[3:2]};
                    2'b11: dout = {din[0],din[3:1]};
                endcase
            end else begin
                //Shift Left
                case(shift_value)
                    2'b00: dout = din;
                    2'b01: dout = {din[0],din[3:1]};
                    2'b10: dout = {din[1:0],din[3:2]};
                    2'b11: dout = {din[2:0],din[3]};
                endcase
            end 
        end    
    end
    
endmodule: barrel_shifter


