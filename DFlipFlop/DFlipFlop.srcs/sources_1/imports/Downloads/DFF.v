`timescale 1ns / 1ps
// D flip-flop with asynchronous reset
// Michelle Lynch

module DFF(
    input wire clk,
    input wire rst,
    input wire d,
    output reg q
    );

always @(posedge clk, negedge rst)
    if(~rst)
        q <= 1'b0;
    else
        q <= d;

endmodule

