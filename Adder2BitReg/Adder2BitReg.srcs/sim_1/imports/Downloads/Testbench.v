`timescale 1ns / 1ps
// Testbench.v
// Michelle Lynch

module Testbench;
    
  reg a, b;
  reg clk, rst;
  wire s, c; 
  localparam T = 10;
  
  Adder2BitReg uut(a, b, clk, rst, s, c);
   
  // Clock
  always
  begin
    clk = 1'b1;
    #(T/2);
    clk = 1'b0;
    #(T/2);
  end
  
  // Reset
  initial
  begin
    rst = 1'b1;
    repeat (2) begin
        @(negedge clk);
    end
    rst = 1'b0;
    repeat (10) begin
        @(negedge clk);
    end
    rst = 1'b1;
  end
  
  // Data
  initial 
  begin
  $display("\n 2 Bit Adder with Registers Test\n");
  a = 1'b0; 
  b = 1'b0;
  @(posedge rst);
  @(negedge clk);
  a = 1'b0;
  b = 1'b1;
  @(negedge clk);
  a = 1'b1;
  b = 1'b0;
  @(negedge clk);
  a = 1'b1;
  b = 1'b1;
  @(negedge rst);
  @(negedge clk);
  a = 1'b0; 
  b = 1'b0;
  end
    
endmodule
