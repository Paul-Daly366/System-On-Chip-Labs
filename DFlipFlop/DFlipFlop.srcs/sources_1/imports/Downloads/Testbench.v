`timescale 1ns / 10ps
// D Flip-Flop Testbench
// Michelle Lynch

module DFFTestbench;
    
    localparam T = 20;
    reg clk, rst;
    reg d;
    wire q;
    
    // Instantiate the unit under test
    DFF uut(.clk(clk), .rst(rst), .d(d), .q(q));
    
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
        rst = 1'b0;
        #(T/2);
        rst = 1'b1;
        #185;
        rst = 1'b0;
     end
    
    // Data input
    initial
    begin
        d = 1'b0;
        @(posedge rst);
        @(negedge clk);
        d = 1'b1;
        @(negedge clk);
        d = 1'b0;
        @(negedge clk);
        @(negedge clk);
        d = 1'b1;
        @(negedge clk);
        @(negedge clk);
        d = 1'b0;
        @(negedge clk);
        d = 1'b1;
        #(4*T);
        $stop;
    end
 
endmodule
