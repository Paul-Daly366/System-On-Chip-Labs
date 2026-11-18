`timescale 1ns / 1ps

// File: Testbench.v
// Author: Michelle Lynch
// Copyright Michelle Lynch 2024

module Testbench;

parameter HDISP = 640;
parameter VDISP = 480;
parameter HFP = 16;
parameter VFP = 10;
parameter HPW = 96;
parameter VPW = 2;
parameter HLIM = 800;
parameter VLIM = 525;
parameter COUNTER_WIDTH = 32;
parameter COUNT_FROM = 0;
parameter COUNT_TO = 26;
parameter COUNT_RESET = 27;
parameter T = 10;

reg clk, rst;
wire hsync, vsync, vid_on;
wire [10:0] row, col;
wire [3:0] red, green, blue;

VGASync #(.HDISP(HDISP), .VDISP(VDISP), .HFP(HFP), .VFP(VFP),
          .HPW(HPW), .VPW(VPW), .HLIM(HLIM), .VLIM(VLIM)) i_VGASync 
         (.clk25(clk), .rst(rst), .hsync(hsync), .vsync(vsync), 
          .vid_on(vid_on), .row(row), .col(col));

ColourStripes #(.COUNTER_WIDTH(COUNTER_WIDTH), .COUNT_TO(COUNT_TO),
              .COUNT_FROM(COUNT_FROM), .COUNT_RESET(COUNT_RESET)) i_colour_stripes
    (.clk(clk), .rst(rst), .row(row), .col(col), .red(red), .green(green), .blue(blue));
   
// TB Clock
always begin
    clk = 1'b0;
    #(T/2);
    clk = 1'b1;
    #(T/2);
end

// TB Reset
initial begin
    rst = 1'b1;
    repeat(2) begin
        @(negedge clk);
    end
    rst = 1'b0;
end
endmodule
