`timescale 1ns / 1ps

module MuxStruct(
    input clk, rst,
    input d0, d1,
    input s,
    output y
    );
    
    reg y_reg;
    wire y_next;
    
	// Next-state logic
    // Add code for multiplexer
    // Structural Code
    assign y_next = (!s & d0) | (s & d1);
    
	// Register
    always @(posedge clk or negedge rst) begin
        if(!rst)
            y_reg <= 1'b0;
        else
            y_reg <= y_next;
    end

    assign y = y_reg;
          
endmodule


