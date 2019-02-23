`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/19 11:57:02
// Design Name: 
// Module Name: CPU_sim
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


module CPU_sim;
     reg  clk;
   reg  Reset;
   reg  keyin;      
   wire keyout;
   //以下提供显示用
   wire [31:0] curPC;
   
   wire [5:0] Opcode;
   wire [4:0] rs;       
   wire [31:0] ReadData1;
   wire [4:0] rt;
   wire [31:0] ReadData2;
   wire [4:0] rd;
   wire [31:0] sa;
    wire [27:0] addr;
   wire [31:0] extendImmediate;
  
   wire [31:0] rega,regb;
   wire [31:0] result;
   wire [31:0] DB;
   wire [15:0] immediate;
wire [1:0] PCSrc;
wire [2:0] ALUopcode;
wire [5:0] WriteReg; 
wire [31:0] NextPC;
wire [31:0] ROMDataOut,RAMDataOut;
wire PCWre,RegDst,RegWre,ExtSel,ALUSrcA,ALUSrcB,RD,WR,DBDataSrc,sign,zero;
wire InsMemRW;
initial begin 
   clk=0;
   keyin=0;
   Reset=1;
   end
   
   always #1 clk<=~clk; 
   always #50 keyin<=~keyin;

ControlUnit U0(.Opcode(Opcode),.zero(zero),.sign(sign),.PCWre(PCWre),
              .ALUSrcA(ALUSrcA),.ALUSrcB(ALUSrcB),.DBDataSrc(DBDataSrc),.RegWre(RegWre),
              .InsMemRw(InsMemRW),.RD(RD),.WR(WR),.RegDst(RegDst),.ExtSel(ExtSel),
              .PCSrc(PCSrc),.ALUOp(ALUopcode));

key_debounce U1 (.clk(clk),.key_in(keyin),.key_out(keyout));
//
PC U2(.Reset(Reset),.clk(keyout),.PCWre(PCWre),.NextPC(NextPC),.curPC(curPC));

ROM U3(.rw(InsMemRW),.addr(curPC),.DataOut(ROMDataOut));

Instruction U4(.DataOut(ROMDataOut),.Opcode(Opcode),.rs(rs),.rt(rt),
   .rd(rd),.sa(sa),.immediate(immediate),.addr(addr));
   
//RegDst数据通路写成两位
//第一个mux 选择写入寄存器
data2Select_5bit S1 (.control(RegDst),.A(rt),.B(rd),.result(WriteReg));
//
RegFile U5 (.CLK(keyout),.RST(Reset),.RegWre(RegWre),.ReadReg1(rs),.ReadReg2(rt)
,.WriteReg(WriteReg),.WriteData(DB),.ReadData1(ReadData1),.ReadData2(ReadData2));

//ExtSel为0则0扩展，为1则符号扩展
SignZeroExtend U6 (.ExtSel(ExtSel),.immediate(immediate),.extendImmediate(extendImmediate));

data3Select S2 (.PCSrc(PCSrc),.curPC(curPC),.extendImmediate(extendImmediate),
   .addr(addr),.NextPC(NextPC));
   
data2Select_32bit S3 (.control(ALUSrcA),.A(ReadData1),.B(sa),.result(rega));

data2Select_32bit S4 (.control(ALUSrcB),.A(ReadData2),.B(extendImmediate),.result(regb));

ALU U7 (.ALUopcode(ALUopcode),.rega(rega),.regb(regb),.result(result),.sign(sign),.zero(zero));
//key_value
RAM U8 (.clk(keyout),.address(result),.writeData(ReadData2),
   .nRD(RD), // 为0，正常读；为1,输出高组态
   .nWR(WR), // 为0，写；为1，无操作
   .Dataout(RAMDataOut));

data2Select_32bit S5 (.control(DBDataSrc),.A(result),.B(RAMDataOut),.result(DB)); 


endmodule

    /*
   reg Reset,clk,keyin;
    wire keyout;
    wire [31:0] curPC;
    wire [31:0] NextPC;
    wire [4:0] rs;
    wire [31:0] ReadData1;
    wire [4:0] rt;
    wire [31:0] ReadData2;
    wire [31:0] result;
    wire   [31:0] DB;
    
    CPU_top T1 (
            .clk(clk),
            .keyin(keyin),
            .Reset(Reset),
            //以下提供显示用
            .curPC(curPC),
            .NextPC(NextPC),
            .rs(rs),
            .ReadData1(ReadData1),
            .rt(rt),
            .ReadData2(ReadData2),
            .result(result),
            .DB(DB),
            .keyout(keyout)
        );
        initial begin 
        clk=0;
        keyin=0;
        Reset=1;
        end
        
        always #1 clk<=~clk; 
        always #50 keyin<=~keyin;

    */

    

