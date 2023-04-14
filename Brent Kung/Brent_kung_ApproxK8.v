`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.04.2023 11:14:30
// Design Name: 
// Module Name: Brent_kung_Aprox
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


module Genration(input A,B,C,D,output X,Y);
  assign X=A&B;
  assign Y=C|(A&D);
endmodule

module Brent_Kung_Approx(input [16:1] A, [16:1] B, input Carry_in, output [16:0] Carry_Out,output [16:1] Sum);
  wire P[5:1][16:1];
  wire G[5:1][16:1];
  assign P[1][1]=A[1]^B[1];
  assign P[1][2]=A[2]^B[2];
  assign P[1][3]=A[3]^B[3];
  assign P[1][4]=A[4]^B[4];
  assign P[1][5]=A[5]^B[5];
  assign P[1][6]=A[6]^B[6];
  assign P[1][7]=A[7]^B[7];
  assign P[1][8]=A[8]^B[8];
  assign P[1][9]=A[9]^B[9];
  assign P[1][10]=A[10]^B[10];
  assign P[1][11]=A[11]^B[11];
  assign P[1][12]=A[12]^B[12];
  assign P[1][13]=A[13]^B[13];
  assign P[1][14]=A[14]^B[14];
  assign P[1][15]=A[15]^B[15];
  assign P[1][16]=A[16]^B[16];
  
  
  assign G[1][1]=A[1]&B[1];
  assign G[1][2]=A[2]&B[2];
  assign G[1][3]=A[3]&B[3];
  assign G[1][4]=A[4]&B[4];
  assign G[1][5]=A[5]&B[5];
  assign G[1][6]=A[6]&B[6];
  assign G[1][7]=A[7]&B[7];
  assign G[1][8]=A[8]&B[8];
  assign G[1][9]=A[9]&B[9];
  assign G[1][10]=A[10]&B[10];
  assign G[1][11]=A[11]&B[11];
  assign G[1][12]=A[12]&B[12];
  assign G[1][13]=A[13]&B[13];
  assign G[1][14]=A[14]&B[14];
  assign G[1][15]=A[15]&B[15];
  assign G[1][16]=A[16]&B[16];
  
  
  
  
 // Genration g1  (P[1][4],P[1][3],G[1][4],G[1][3],P[2][4],G[2][4]);
//  Genration g2  (P[1][6],P[1][5],G[1][6],G[1][5],P[2][6],G[2][6]);
 // Genration g3  (P[1][8],P[1][7],G[1][8],G[1][7],P[2][8],G[2][8]);
  Genration g4  (P[1][10],P[1][9],G[1][10],G[1][9],P[2][10],G[2][10]);
  Genration g5  (P[1][12],P[1][11],G[1][12],G[1][11],P[2][12],G[2][12]);
  Genration g6  (P[1][14],P[1][13],G[1][14],G[1][13],P[2][14],G[2][14]);
  Genration g7  (P[1][16],P[1][15],G[1][16],G[1][15],P[2][16],G[2][16]);
 // Genration g8  (P[1][5],P[2][4],G[1][5],G[2][4],P[2][5],G[2][5]);
  //Genration g9  (P[1][7],P[2][6],G[1][7],G[2][6],P[2][7],G[2][7]);
  //Genration g10 (P[2][8],P[2][6],G[2][8],G[2][6],P[3][8],G[3][8]);
 // Genration g11 (P[1][9],P[2][8],G[1][9],G[2][8],P[2][9],G[2][9]);
  //Genration g12 (P[2][10],P[2][8],G[2][10],G[2][8],P[3][10],G[3][10]);
  Genration g13 (P[1][11],P[2][10],G[1][11],G[2][10],P[2][11],G[2][11]);
  Genration g14 (P[2][12],P[2][10],G[2][12],G[2][10],P[3][12],G[3][12]);
  Genration g15 (P[1][13],P[3][12],G[1][13],G[3][12],P[2][13],G[2][13]);
  Genration g16 (P[2][14],P[2][13],G[2][14],G[2][13],P[3][14],G[3][14]);
 // Genration g17 (P[3][14],P[3][10],G[3][14],G[3][10],P[4][14],G[4][14]);
  Genration g38 (P[1][15],P[3][14],G[1][15],G[3][14],P[2][15],G[2][15]);
  Genration g39 (P[2][16],P[2][14],G[2][16],G[2][14],P[3][16],G[3][16]);
  Genration g18 (P[3][16],P[3][12],G[3][16],G[3][12],P[4][16],G[4][16]);
//  Genration g19 (P[2][16],P[2][15],G[2][16],G[2][15],P[3][16],G[3][16]);
//  Genration g20 (P[2][13],P[4][10],G[2][13],G[4][10],P[3][13],G[3][13]);
//  Genration g21 (P[3][14],P[4][10],G[3][14],G[4][10],P[4][14],G[4][14]);
//  Genration g22 (P[2][15],P[4][10],G[2][15],G[4][10],P[3][15],G[3][15]);
//  Genration g23 (P[3][16],P[4][10],G[3][16],G[4][10],P[4][16],G[4][16]);
  //Genration g24 (P[1][3],P[1][2],G[1][3],G[1][2],P[5][3],G[5][3]);
  //Genration g25 (P[2][4],P[1][2],G[2][4],G[1][2],P[5][4],G[5][4]);
  //Genration g26 (P[2][5],P[1][2],G[2][5],G[1][2],P[5][5],G[5][5]);
  //Genration g27 (P[3][6],P[1][2],G[3][6],G[1][2],P[5][6],G[5][6]);
  //Genration g28 (P[2][7],P[1][2],G[2][7],G[1][2],P[5][7],G[5][7]);
  //Genration g29 (P[3][8],P[1][2],G[3][8],G[1][2],P[5][8],G[5][8]);
  //Genration g30 (P[3][9],P[1][2],G[3][9],G[1][2],P[5][9],G[5][9]);
  //Genration g31 (P[4][10],P[1][2],G[4][10],G[1][2],P[5][10],G[5][10]);
  //Genration g32 (P[2][11],P[1][2],G[2][11],G[1][2],P[5][11],G[5][11]);
  //Genration g33 (P[3][12],P[1][2],G[3][12],G[1][2],P[5][12],G[5][12]);
  //Genration g34(P[3][13],P[1][2],G[3][13],G[1][2],P[5][13],G[5][13]);
  //Genration g35 (P[4][14],P[1][2],G[4][14],G[1][2],P[5][14],G[5][14]);
  //Genration g36 (P[3][15],P[1][2],G[3][15],G[1][2],P[5][15],G[5][15]);
  //Genration g37 (P[4][16],P[1][2],G[4][16],G[1][2],P[5][16],G[5][16]);
  
  assign Carry_Out[0]=Carry_in;  
  assign Carry_Out[1]= G[1][1];
  assign Carry_Out[2]= G[1][2];
  assign Carry_Out[3]= G[1][3];
  assign Carry_Out[4]= G[1][4];
  assign Carry_Out[5]= G[1][5];
  assign Carry_Out[6]= G[1][6];
  assign Carry_Out[7]= G[1][7];
  assign Carry_Out[8]= G[1][8];
  assign Carry_Out[9]= (Carry_Out[6]&P[1][9])|G[1][9];
  assign Carry_Out[10]= (Carry_Out[6]&P[2][10])|G[2][10];
  assign Carry_Out[11]= (Carry_Out[6]&P[2][11])|G[2][11];
  assign Carry_Out[12]= (Carry_Out[6]&P[3][12])|G[3][12];
  assign Carry_Out[13]= (Carry_Out[6]&P[2][13])|G[2][13];
  assign Carry_Out[14]= (Carry_Out[6]&P[2][14])|G[2][14];
  assign Carry_Out[15]= (Carry_Out[6]&P[2][15])|G[2][15];
  assign Carry_Out[16]= (Carry_Out[6]&P[4][16])|G[4][16];
  
  
  
  
  assign Sum[1]= P[1][1];
  assign Sum[2]= G[1][1]^P[1][2];
  assign Sum[3]= Carry_Out[2]^P[1][3];
  //assign Sum[3]=G[1][3];
  assign Sum[4]= Carry_Out[3]^P[1][4];
  assign Sum[5]= Carry_Out[4]^P[1][5];
  assign Sum[6]= Carry_Out[5]^P[1][6];
  assign Sum[7]= Carry_Out[6]^P[1][7];
  assign Sum[8]= Carry_Out[7]^P[1][8];
  assign Sum[9]= Carry_Out[8]^P[1][9];
  assign Sum[10]= Carry_Out[9]^P[1][10];
  assign Sum[11]= Carry_Out[10]^P[1][11];
  assign Sum[12]= Carry_Out[11]^P[1][12];
  assign Sum[13]= Carry_Out[12]^P[1][13];
  assign Sum[14]= Carry_Out[13]^P[1][14];
  assign Sum[15]= Carry_Out[14]^P[1][15];
  assign Sum[16]= Carry_Out[15]^P[1][16];
  
  
  
  
  
  
  
  
  
  
  

endmodule
