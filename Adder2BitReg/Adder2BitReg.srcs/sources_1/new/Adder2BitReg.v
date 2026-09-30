`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// 2-Bit Adder with registered outputs

// 30.09.2026

// Paul Daly

//////////////////////////////////////////////////////////////////////////////////


module Adder2BitReg(
    input a,
    input b,
    input clk,
    input rst,
    output s,
    output c
    );
    
reg s_reg, c_reg;
wire s_next, c_next;

assign s_next = a ^ b;
assign c_next = a & b; 

always @(posedge clk, negedge rst) begin
    if(!rst) begin
        s_reg <= 1'b0;
        c_reg <= 1'b0;
    end
    else begin
        s_reg <= s_next;
        c_reg <= c_next;
    end
end
    
assign s = s_reg;
assign c = c_reg;
    
endmodule
