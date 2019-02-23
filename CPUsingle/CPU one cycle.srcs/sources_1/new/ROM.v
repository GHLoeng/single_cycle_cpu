`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/11/13 17:22:10
// Design Name: 
// Module Name: ROM
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


module ROM (  // �洢��ģ�� 
     input  rw,      // ��ʹ���ź�      
     input [ 31:0] addr,    // �洢����ַ     
     output  reg [31:0] DataOut   // ���������
     );
     reg [7:0]  rom [99:0]; // �洢�����������reg���ͣ��洢���洢��Ԫ8λ���ȣ���100���洢��Ԫ     
     initial begin     // �������ݵ��洢��rom��ע�⣺����ʹ�þ���·�����磺E:/Xlinx/VivadoProject/ROM/���Լ�����            
         $readmemb ("G:/Vivado/CPUsingle/rom_data.txt", rom);  // �����ļ�rom_data��.coe��.txt����δָ�����ʹ�0��ַ��ʼ��š�        
     end     
     always @( rw or addr ) begin           
         if (rw==1) begin            // Ϊ1�����洢����������ݴ洢ģʽ               
          DataOut[31:24] = rom[addr];                
          DataOut[23:16] = rom[addr+1];                
          DataOut[15:8] = rom[addr+2];                
          DataOut[7:0] = rom[addr+3]; 
          end       
     end 
     endmodule 