`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/19 17:19:52
// Design Name: 
// Module Name: LED_sim
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


module LED_sim;
    reg clk;
    reg [1:0] SW;
    reg [31:0] curPC;
    reg [31:0] NextPC;
    reg [4:0] rs;
    reg [31:0] ReadData1;
    reg [4:0] rt;
    reg [31:0] ReadData2;
    reg [31:0] result;
    reg [31:0] DB;
    wire [6:0] a_to_g;
    wire [3:0] pos;
    LED_top T3 (.clk(clk),.SW(SW),.curPC(curPC),.NextPC(NextPC),.rs(rs),
                    .ReadData1(ReadData1),.rt(rt),.ReadData2(ReadData2),
                    .result(result),.DB(DB),.a_to_g(a_to_g),.pos(pos)
                    );
    initial begin
    clk=0;
    SW=0;
    curPC=0;
    NextPC=0;
    rs=1;
    ReadData1=1;
    rt=2;
    ReadData2=2;
    result =3;
    DB=4;
    end
    always begin
    #10; clk =~clk;
    end
    always begin
    #50;
    SW = SW+1;
    end
endmodule
