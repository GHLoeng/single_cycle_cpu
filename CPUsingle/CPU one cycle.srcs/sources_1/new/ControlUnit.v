`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/15 10:36:22
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [5:0] Opcode,
    input zero,
    input sign,
    output reg PCWre,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg DBDataSrc,
    output reg RegWre,
    output reg InsMemRw,
    output reg RD,
    output reg WR,
    output reg RegDst,
    output reg ExtSel,
    output reg [1:0] PCSrc,
    output reg [2:0] ALUOp
    );
    initial begin
    InsMemRw=1;
    end
    
    always@ (Opcode or sign or zero) begin
    PCWre = (Opcode == 6'b111111)? 0:1;
    ALUSrcA = (Opcode == 6'b011000)? 1:0;
    ALUSrcB = (Opcode == 6'b000001 || Opcode == 6'b010000 || Opcode == 6'b100110 || Opcode == 6'b100111)? 1:0;
    DBDataSrc = (Opcode == 6'b100111)? 1:0;
     RegWre = (Opcode == 6'b100110 || Opcode == 6'b110001 || Opcode == 6'b110000 
    || Opcode == 6'b110010 || Opcode == 6'b111000 || Opcode == 6'b111111)? 0:1;
     InsMemRw = 1;
     RD = (Opcode == 6'b100111)? 0:1;
     WR = (Opcode == 6'b100110)? 0:1;
      RegDst = (Opcode == 6'b000001 || Opcode == 6'b010000 || Opcode == 6'b100111)? 0:1;
     ExtSel = (Opcode == 6'b010000)? 0:1;
     PCSrc[0] = ((Opcode == 6'b110001 && zero==0) || (Opcode == 6'b110000 && zero==1) || (Opcode == 6'b110010 && zero==0 && sign==0))? 1:0;
    PCSrc[1] = (Opcode == 6'b111000)? 1:0;
     ALUOp[0] = (Opcode == 6'b000010 || Opcode == 6'b010000 || Opcode == 6'b010010
    || Opcode == 6'b110001 || Opcode == 6'b110000 || Opcode == 6'b110010)? 1:0;
     ALUOp[1] = (Opcode == 6'b010000 || Opcode == 6'b010010 || Opcode == 6'b011000 || Opcode == 6'b011100)? 1:0;
     ALUOp[2] = (Opcode == 6'b010001 || Opcode == 6'b011100)? 1:0;
    end
endmodule

/*
module ControlUnit(
    input [5:0] Opcode,
    input zero,
    input sign,
    output  PCWre,
    output  ALUSrcA,
    output  ALUSrcB,
    output  DBDataSrc,
    output RegWre,
    output  InsMemRw,
    output  RD,
    output  WR,
    output  RegDst,
    output  ExtSel,
    output [1:0] PCSrc,
    output  [2:0] ALUOp
    );
    initial begin
    PCWre=1;
        PCWre=1;
        ALUSrcA=0;
        ALUSrcB=1;
        DBDataSrc=0;
        RegWre=1;
        InsMemRw=1;
        RD=1;
        WR=1;
        RegDst=0;
        ExtSel=1;
        PCSrc=0;
        ALUOp=0;
        end;
        
   
    assign PCWre = (Opcode == 6'b111111)? 0:1;
    assign ALUSrcA = (Opcode == 6'b011000)? 1:0;
    assign ALUSrcB = (Opcode == 6'b000001 || Opcode == 6'b010000 || Opcode == 6'b100110 || Opcode == 6'b100111)? 1:0;
    assign DBDataSrc = (Opcode == 6'b100111)? 1:0;
    assign  RegWre = (Opcode == 6'b100110 || Opcode == 6'b110001 || Opcode == 6'b110000 
    || Opcode == 6'b110010 || Opcode == 6'b111000 || Opcode == 6'b111111)? 0:1;
    assign  InsMemRw = 1;
    assign  RD = (Opcode == 6'b100111)? 0:1;
    assign  WR = (Opcode == 6'b100110)? 0:1;
     assign  RegDst = (Opcode == 6'b000001 || Opcode == 6'b010000 || Opcode == 6'b100111)? 0:1;
     assign ExtSel = (Opcode == 6'b010000)? 0:1;
    assign  PCSrc[0] = ((Opcode == 6'b110111 && zero==1) || (Opcode == 6'b110000 && zero==1) || (Opcode == 6'b110010 && zero==0 && sign==0))? 1:0;
    assign PCSrc[1] = (Opcode == 6'b111000)? 1:0;
    assign  ALUOp[0] = (Opcode == 6'b000010 || Opcode == 6'b010000 || Opcode == 6'b010010
    || Opcode == 6'b110001 || Opcode == 6'b110000 || Opcode == 6'b110010)? 1:0;
     assign ALUOp[1] = (Opcode == 6'b010000 || Opcode == 6'b010010 || Opcode == 6'b011000 || Opcode == 6'b011100)? 1:0;
     assign ALUOp[2] = (Opcode == 6'b010001 || Opcode == 6'b011100)? 1:0;
    */
