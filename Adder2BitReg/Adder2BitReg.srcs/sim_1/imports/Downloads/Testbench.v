`timescale 1ns / 1ps
// Testbench.v
// Michelle Lynch

module Testbench;
    
  reg a, b;
  reg clk, rst_n;
  wire s, c; 
  localparam T = 10;
  
  // Instantiate an object from the class Adder2BitReg, uut = unit under test, in this case it's the name of the object we're making
  // Class name(Parameters);
  Adder2BitReg uut(
  .a(a), .b(b), .clk(clk), .rst_n(rst_n), .s(s), .c(c));
   
  // Clock
  always
  begin
    clk = 1'b1;
    #(T/2);
    clk = 1'b0;
    #(T/2);
  end
  
  // Reset (?)
  initial
  begin
    rst_n = 1'b0;
    repeat (2) begin
        @(negedge clk);
    end
    rst_n = 1'b1;
  end
  
  // Data
  initial 
  begin
  $display("\n 2 Bit Adder with Registers Test\n");
  a = 1'b0; 
  b = 1'b0;
  @(posedge rst_n);
  @(negedge clk);
  a = 1'b0;
  b = 1'b1;
  @(negedge clk);
  a = 1'b1;
  b = 1'b0;
  @(negedge clk);
  a = 1'b1;
  b = 1'b1;
  @(negedge rst_n);
  @(negedge clk);
  a = 1'b0; 
  b = 1'b0;
  end
    
endmodule
