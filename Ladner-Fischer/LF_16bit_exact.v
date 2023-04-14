`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 22:47:04
// Design Name: 
// Module Name: BK
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


module Ladner_Fischer_16_ex(A,B,Cin,Sum);
    input [15:0] A,B;
    input Cin;
    output reg [15:0] Sum;
    reg [8:0] Cout;
    reg P[4:1][15:0];
    reg G[4:1][15:0];
    integer i;
//    vio_0 your_instance_name (
//  .clk(clk),                // input wire clk
//  .probe_in0(Sum),    // input wire [7 : 0] probe_in0
//  .probe_out0(A),  // output wire [7 : 0] probe_out0
//  .probe_out1(B),  // output wire [7 : 0] probe_out1
//  .probe_out2(Cin)  // output wire [0 : 0] probe_out2
//);

    always @(*) begin
        Cout = 0;
        Sum = 0;
        for( i=0;i<=7;i=i+1)
        begin 
            P[1][i]=A[i]^B[i]; 
            G[1][i]=A[i]&B[i]; 
        end
        P[2][1] = P[1][1]&P[1][0];
        G[2][1] = (G[1][0]&P[1][1])|G[1][1];
        P[2][3] = P[1][3]&P[1][2];
        G[2][3] = (G[1][2]&P[1][3])|G[1][3];
        P[2][5] = P[1][4]&P[1][5];
        G[2][5] = (G[1][4]&P[1][5])|G[1][5];
        P[2][7] = P[1][7]&P[1][6];
        G[2][7] = (G[1][6]&P[1][7])|G[1][7];
        P[3][3] = P[2][1]&P[2][3];
        G[3][3] = (G[2][1]&P[2][3])|G[2][3];
        P[3][7] = P[2][5]&P[2][7];
        G[3][7] = (G[2][5]&P[2][7])|G[2][7];
        P[4][7] = P[3][3]&P[3][7];
        G[4][7] = (G[3][3]&P[3][7])|G[3][7];
        P[4][1] = P[2][1];
        G[4][1] = G[2][1];
        P[4][3] = P[3][3];
        G[4][3] = G[3][3];
        P[4][2] = P[2][1]&P[1][2];
        G[4][2] = (P[1][2]&G[2][1])|G[1][2];
        P[4][4] = P[1][4]&P[4][3];
        G[4][4] = (P[1][4]&G[4][3])|G[1][4];
        P[4][5] = P[2][5]&P[3][3];
        G[4][5] = (P[2][5]&G[3][3])|G[2][5];
        P[3][6] = P[1][6]&P[2][5];
        G[3][6] = (G[2][5]&P[1][6])|G[1][6];
        P[4][6] = P[3][3]&P[3][6];
        G[4][6] = (P[3][6]&G[3][3])|G[3][6];
        P[4][0] = P[1][0];
        G[4][0] = G[1][0];
//        Cout[0] = (Cin&P[4][0])|G[4][0];
//        Sum[0] = A[0]^B[0]^Cin;
        Cout[0] = Cin;
        for (i=0;i<=7;i=i+1) begin
            Cout[i+1] = (Cin&P[4][i])|G[4][i];
            Sum[i] = A[i]^B[i]^Cout[i];
        end
        
    end
endmodule
