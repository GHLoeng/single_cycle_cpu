`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/18 20:33:08
// Design Name: 
// Module Name: testled
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


module testled;
   reg  [15:0]x;
   reg clk190;
    wire [6:0] a_to_g;
    wire [3:0] pos;
    seg7 TE (.x(x),.clk190(clk190),.a_to_g(a_to_g),.pos(pos));
    initial begin
    x=0;
    clk190=0;
    end
    always begin
    #20; 
    clk190=~clk190;
   
    end
endmodule
