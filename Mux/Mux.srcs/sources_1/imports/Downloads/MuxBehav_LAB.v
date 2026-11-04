`timescale 1ns / 1ps

module MuxBehav(
    input clk, rst,
    input d0, d1,
    input s,
    output y
    );
    
    reg y_reg;
    reg y_next;
   
    // Next-state logic
	// !s.d0 + s.d1
	// Behaviour code
    always @* begin
        case(s)
            1'b0: y_next = d0;
            1'b1: y_next = d1;
            default: y_next = d0;
        endcase
    end
	
	// Register
    always @(posedge clk or negedge rst) begin
      if(!rst)
         y_reg <= 1'b0;
      else
         y_reg <= y_next;
      end

    assign y = y_reg;
          
endmodule