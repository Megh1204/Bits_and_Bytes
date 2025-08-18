module mux_2x1 #(parameter WIDTH=4)  
    (
        input logic [WIDTH-1:0] in0,
        input logic [WIDTH-1:0] in1,
        input logic sel, 
        output logic [WIDTH-1:0] out
    ); 
  
    always @(sel or in0 or in1) begin
        if(sel == 0)
            out = in0;
        else
            out = in1; 
    end
    
endmodule: mux_2x1
 

