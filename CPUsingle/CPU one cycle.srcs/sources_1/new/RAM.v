`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/01 10:34:54
// Design Name: 
// Module Name: RAM
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


 module RAM(
    input clk,
    input [31:0] address,
    input [31:0] writeData, // [31:24], [23:16], [15:8], [7:0]
    input nRD, // Ϊ0����������Ϊ1,�������̬
    input nWR, // Ϊ0��д��Ϊ1���޲���
    output reg [31:0] Dataout
);
reg [7:0] ram [0:60]; //�洢��

// ��
always @ (*) begin
Dataout[7:0] = (nRD==0)?ram[address + 3]:8'bz; // z Ϊ����̬
Dataout[15:8] = (nRD==0)?ram[address + 2]:8'bz;
Dataout[23:16] = (nRD==0)?ram[address + 1]:8'bz;
Dataout[31:24] = (nRD==0)?ram[address ]:8'bz;
end
// д
always@( negedge clk ) begin
    if( nWR==0 ) begin
        ram [address] <= writeData[31:24];
        ram[address+1] <= writeData[23:16];
        ram[address+2] <= writeData[15:8];
        ram[address+3] <= writeData[7:0];
    end
end
endmodule
