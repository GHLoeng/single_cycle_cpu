`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/13 17:32:05
// Design Name: 
// Module Name: latch
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


module lacth ( //������
    input d,
    input sel,
    output z 
    );
    // ����ڸ����������±���û�и�ֵ���������������ԭֵ��������һ��������     
    always @(sel or d) begin             
    if(sel == 1'b1)                 
    z <= d;              // ��������ֵ��     
    end endmodule