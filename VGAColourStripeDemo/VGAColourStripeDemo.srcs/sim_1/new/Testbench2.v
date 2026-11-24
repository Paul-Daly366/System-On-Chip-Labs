`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  I hate testbenchs
//////////////////////////////////////////////////////////////////////////////////


module Testbench2;
    parameter HDISP = 6;
    parameter VDISP = 2;
    parameter HFP = 1;
    parameter VFP = 1;
    parameter HPW = 1;
    parameter VPW = 1;
    parameter HLIM = 10;
    parameter VLIM = 6;
    parameter COUNTER_WIDTH = 3;
    parameter COUNT_FROM = 0;
    parameter COUNT_TO = 3;
    parameter COUNT_RESET = 3;
    parameter T = 10;

    reg a, b;
    reg clk, rst;
    

VGASync #(.HDISP(HDISP), .VDISP(VDISP), .HFP(HFP), .VFP(VFP),
          .HPW(HPW), .VPW(VPW), .HLIM(HLIM), .VLIM(VLIM)) i_VGASync 
         (.clk25(clk), .rst(rst), .hsync(hsync), .vsync(vsync), 
          .vid_on(vid_on), .row(row), .col(col));

ColourStripes #(.COUNTER_WIDTH(COUNTER_WIDTH), .COUNT_TO(COUNT_TO),
                           .COUNT_FROM(COUNT_FROM), .COUNT_RESET(COUNT_RESET)) i_colour_stripes
    (.clk(clk), .rst(rst), .row(row), .col(col), .red(red), .green(green), .blue(blue));

    always
    begin
        clk = 1'b0;
        #(T/2);
        clk = 1'b1;
        #(T/2);
    end

    initial
    begin
        rst = 1'b0;
        repeat (2) begin
            @(negedge clk);
        end
        rst = 1'b1;
    end

    initial
    begin
    a = 1'b0;
    @(posedge rst);
    @(negedge clk);
    a = 1'b1;
    @(negedge clk);
    a = 1'b0;
    end
endmodule
