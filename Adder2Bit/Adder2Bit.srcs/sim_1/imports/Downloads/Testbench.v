`timescale 1ns / 1ps
// Testbench.v
// Michelle Lynch

module Testbench;
    
    reg a, b;
    wire s, c;
    
    Adder2Bit uut(a, b, s, c);

    initial 
    begin
    $display("\n 2 Bit Adder Test\n");
    a = 0; b = 0;
    #10
    a = 1; b = 0;
    #10
    a = 0; b = 1;
    #10
    a = 1; b = 1;
    #10
    a = 0; b = 0;
    
    #10
    a = 1; b = 1;
    #10
    a = 0; b = 0;
    end
    
endmodule
