`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  Paul Daly - G00470372
// 
//////////////////////////////////////////////////////////////////////////////////


module VGACircleTest #(
    parameter COUNTER_WIDTH = 32, 
    parameter COUNT_FROM = 0,
    parameter COUNT_TO = 32'b1 << 22,
    parameter COUNT_RESET = 32'b1 << 27,
    parameter HDISP = 640,
    parameter VDISP = 480
    )
    (input clk, rst,
     input [10:0] row, col, 
     output [3:0] red, green, blue);
     
wire signed [11:0] dx;
wire signed [11:0] dy;
wire [23:0] dist_sq;

assign dist_sq = dx * dx + dy * dy;
assign dx = col - 320;
assign dy = row - 240;

reg [3:0] red_reg, green_reg, blue_reg, red_next, green_next, blue_next;
reg [COUNTER_WIDTH:0] count;

always @(*) begin
    red_next = 4'h0;
    green_next = 4'h0;
    blue_next = 4'h0;
    if (dist_sq <= 1000) begin
        red_next = 4'hF;
        green_next = 4'hF;
        blue_next = 4'hF;
    end
end


//COUNTER
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

//COLOUR REG
always@(posedge clk, posedge rst) begin
    if(rst == 1'b1) begin
        red_reg <= 4'h0;
        green_reg <= 4'h0;
        blue_reg <= 4'h0;
    end
    else begin
        red_reg <= red_next;
        green_reg <= green_next;
        blue_reg <= blue_next;
    end
end

assign red = red_reg;
assign green = green_reg;
assign blue = blue_reg;     
     
endmodule