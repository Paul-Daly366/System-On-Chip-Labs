`timescale 1ns / 10ps
// 2-bit Adder
// Michelle Lynch

module Adder2Bit(
    input  a,
    input  b,
    output s,
    output c
    );
    
    assign s = a ^ b;
    assign c = a & b;
    
endmodule


