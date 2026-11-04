`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Author: Paul Daly
// Simple Code to display a single colour
// 
// ??? Wrong I think: This module serves as a function, when called, this code is ran once through and back to VGATop
// ??? This is a file that dictates how hardware runnign from a clock is configured, so thinking of it in terms of regular code may not be accurate
//
//////////////////////////////////////////////////////////////////////////////////

 // ??? What do these parameters do? Figure that out so you can explain it (likely clock things or 'constants' for VGA driving)
module VGASimpleTest #(
    parameter COUNTER_WIDTH = 32, 
    parameter COUNT_FROM = 0,
    parameter COUNT_TO = 32'b1 << 26,
    parameter COUNT_RESET = 32'b1 << 27)
    (input clk, rst,
     input [10:0] row, col, 
     output [3:0] red, green, blue);

reg [3:0] red_reg, green_reg, blue_reg, red_next, green_next, blue_next, background;

// Try a sprite, maybe a 2d array: https://docs.amd.com/r/en-US/ug901-vivado-synthesis/Multi-Dimensional-Array-Example-Two
reg [3:0] sprite1 [0:3][0:3];

initial begin
    // Set a background colour, if nothing else is being printed on a pixel, this will be printed
    background = 4'b0110;
    
end
always@* begin
    if(row >= 11'd5 && row <= 11'd15 && col >= 11'd5 && col<=11'd15 ) begin
    red_next <= 4'b0000;
    green_next <= 4'b0000;
    blue_next <= 4'b0000;
    end
    else begin
        red_next <= background;
        green_next <= background;
        blue_next <= background;
    end
end

// Register RGB values
// This saves values if reset isn't active
always@(posedge clk, posedge rst) begin
    if(rst == 1'b1) begin
        red_reg <= 4'b0000;
        green_reg <= 4'b0000;
        blue_reg <= 4'b0000;
    end
    else begin
        red_reg <= red_next;
        green_reg <= green_next;
        blue_reg <= blue_next;
    end
end

// Assign outputs after registering
assign red = red_reg;
assign green = green_reg;
assign blue = blue_reg;

endmodule