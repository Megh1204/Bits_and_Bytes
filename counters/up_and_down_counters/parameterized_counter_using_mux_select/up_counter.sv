module up_counter  
    #(parameter WIDTH=4)  
    ( 
        input logic clk,
        input logic clear, 
        output logic[WIDTH-1:0] count
    );

    logic[WIDTH-1:0] cnt_value; 
  
    always @(posedge clk or posedge clear) begin
        if (clear == 1)
            cnt_value = {WIDTH{1'b0}};
        else 
            cnt_value = cnt_value + 1'b1;
    end

    assign count = cnt_value;

endmodule: up_counter  