`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Author: Paul Daly
// Testing VGA stuff
// 
//
//////////////////////////////////////////////////////////////////////////////////

module VGASimpleTest #(
    parameter COUNTER_WIDTH = 32, 
    parameter COUNT_FROM = 0,
    parameter COUNT_TO = 32'b1 << 22,
    parameter COUNT_RESET = 32'b1 << 27,
    parameter XY_ONE_START = 11'd5,
    parameter XY_TWO_START = 11'd15,
    parameter HDISP = 640,
    parameter VDISP = 480
    )
    (input clk, rst,
     input [10:0] row, col, 
     output [3:0] red, green, blue);

reg [3:0] red_reg, green_reg, blue_reg, red_next, green_next, blue_next;
reg [COUNTER_WIDTH:0] count; // COUNT VARIABLES
reg [10:0] sq_x1_next = XY_ONE_START , sq_x2_next = XY_TWO_START ,sq_y1_next = XY_ONE_START , sq_y2_next = XY_TWO_START ,  sq_x1_reg, sq_x2_reg, sq_y1_reg, sq_y2_reg; // X Y COORDS OF SQUARE

// Try a sprite, maybe a 2d array: https://docs.amd.com/r/en-US/ug901-vivado-synthesis/Multi-Dimensional-Array-Example-Two


// Counter
//
always@(posedge clk, posedge rst) begin
    if(rst == 1'b1)
        count <= COUNT_FROM;
    else
    begin
        if(count == COUNT_TO)
            count <= 0;
        else
            count <= count + 1;
    end
end

// Colour decider, checks whether current x,y is where square is
// Combinational Logic
always@* begin
    if( count == COUNT_TO ) begin
        sq_x1_next = sq_x1_reg + 1;
        sq_x2_next = sq_x2_reg + 1;
        sq_y1_next = sq_y1_reg + 1;
        sq_y2_next = sq_y2_reg + 1;
    end
    
    if( sq_x1_next > HDISP  ) begin
        sq_x1_next = XY_ONE_START;
        sq_x2_next =  XY_TWO_START;
        sq_y1_next = XY_ONE_START;
        sq_y2_next =  XY_TWO_START;
    end

    if( row >= sq_y1_reg && row <= sq_y2_reg && col >= sq_x1_reg && col<=sq_x2_reg ) begin
        red_next <= 4'b0000;
        green_next <= 4'b0000;
        blue_next <= 4'b0000;
    end
    else begin
        red_next <= 4'b0110;
        green_next <= 4'b0110;
        blue_next <= 4'b0110;
    end
end

// Sequential Logic
// Register RGB values
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
//Register square positions
always@(posedge clk, posedge rst) begin
    if(rst == 1'b1) begin
        sq_x1_reg <= XY_ONE_START;
        sq_x2_reg <= XY_TWO_START;
        sq_y1_reg <= XY_ONE_START;
        sq_y2_reg <= XY_TWO_START;
    end
    else begin
        sq_x1_reg <= sq_x1_next;
        sq_x2_reg <= sq_x2_next;
        sq_y1_reg <= sq_y1_next;
        sq_y2_reg <= sq_y2_next;
    end
end

// Assign outputs after registering
assign red = red_reg;
assign green = green_reg;
assign blue = blue_reg;

endmodule