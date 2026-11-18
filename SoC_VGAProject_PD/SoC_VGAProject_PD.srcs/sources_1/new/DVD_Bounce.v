`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.11.2026 16:01:12
// Design Name: 
// Module Name: DVD_Bounce
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DVD_Bounce #(
    parameter COUNTER_WIDTH = 32, 
    parameter COUNT_FROM = 0,
    parameter COUNT_TO = 32'b1 << 22,
    parameter COUNT_RESET = 32'b1 << 27,
    parameter HDISP = 640,
    parameter VDISP = 480
    )
    (input clk, rst,
    input [10:0] row, col,
    output [3:0] red,green,blue);
    
endmodule
