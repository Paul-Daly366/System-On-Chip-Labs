`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//  Paul Daly - G00470372
//  SoC VGA Project
//////////////////////////////////////////////////////////////////////////////////


module VGACircleTest #(
    parameter COUNTER_WIDTH = 32, 
    parameter COUNT_FROM = 0,
    parameter COUNT_TO = 32'b1 << 22,
    parameter COUNT_RESET = 32'b1 << 27,
    parameter CIRCLE_X_ST = 240,
    parameter CIRCLE_Y_ST = 320,
    parameter DIST_SQ_SIZE = 1000,
    parameter HDISP = 640,
    parameter VDISP = 480
    )
    (input clk, rst,
     input [10:0] row, col, 
     output [3:0] red, green, blue);
     
reg [3:0]                    red_reg,    green_reg,     blue_reg,     red_next,     green_next,     blue_next;
reg [COUNTER_WIDTH:0] count;
reg [10:0]                  circle_x_reg,       circle_y_reg,        circle_x_next = CIRCLE_X_ST,     circle_y_next =  CIRCLE_Y_ST;
reg signed [11:0]     dx_reg=0,             dx_next=0,            dy_reg=0,                                      dy_next=0;
reg [23:0]                  dist_sq_reg=0,    dist_sq_next=0;
reg signed [2:0]        x_dir_reg = -1,    x_dir_next = -1,    y_dir_reg = -1,                              y_dir_next = -1;

//POSITION & COLOUR COMBINATIONAL LOGIC
always @(*) begin
    dx_next = col - circle_x_reg;
    dy_next = row - circle_y_reg;
    dist_sq_next = (dx_reg * dx_reg) + (dy_reg * dy_reg);

    if( count == COUNT_TO ) begin
        circle_x_next = circle_x_reg + x_dir_reg;
        circle_y_next = circle_y_reg + y_dir_reg;
    end

    red_next = 4'h0;
    green_next = 4'h0;
    blue_next = 4'h0;
    if (dist_sq_reg <= DIST_SQ_SIZE) begin
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

//DX,DY REG
always@(posedge clk, posedge rst) begin
    if(rst == 1'b1) begin
       dx_reg <= 0;
        dy_reg <= 0;
    end
    else begin
        dx_reg <= dx_next;
        dy_reg <= dy_next;
    end
end

//DIST_SQ REG
always@(posedge clk, posedge rst) begin
    if(rst == 1'b1) begin
       dist_sq_reg <= 0;
    end
    else begin
        dist_sq_reg <= dist_sq_next;
    end
end

//CIRCLE X,Y REG
always@(posedge clk, posedge rst) begin
    if(rst == 1'b1) begin
        circle_x_reg <= CIRCLE_X_ST;
        circle_y_reg <= CIRCLE_Y_ST;
    end
    else begin
        circle_x_reg <= circle_x_next;
        circle_y_reg <= circle_y_next;
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