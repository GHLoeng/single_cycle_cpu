`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/17 08:51:38
// Design Name: 
// Module Name: data2Select
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


module data2Select_5bit(
    input control,
    input [4:0] A,
    input [4:0] B,
    output [4:0] result
    );

     assign result = (control == 0)? A:B;
endmodule
