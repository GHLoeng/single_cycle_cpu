`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/15 19:04:22
// Design Name: 
// Module Name: SignZeroExtend
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


module SignZeroExtend(
    input ExtSel,//ExtSelΪ0��0��չ��Ϊ1�������չ
    input [15:0] immediate,
    output  [31:0] extendImmediate
    );
    reg [31:0] extend;
    assign extendImmediate [31:0] = extend [31:0];
    always@(*) begin
    extend [15:0] <= immediate;
    if (ExtSel == 0)
    extend [31:16] <= 16'h0000;
    else begin
        if (immediate[15] == 1)
        extend[31:16] <= 16'hffff;
        else
        extend[31:16] <= 16'h0000;
    end
    end
    
endmodule
