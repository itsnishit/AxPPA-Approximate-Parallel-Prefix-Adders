
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.03.2023 22:20:05
// Design Name: 
// Module Name: Kogge_Stone
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


module Kogge_Stone(input [16:1] A, input [16:1] B, input Carry_in,output reg [17:1] Carry_Out,output reg [17:1] Sum);
reg P[9:1][17:1];
reg G[9:1][17:1];
integer i;
integer k;
integer j;
initial
begin
    Sum=0;
    Carry_Out=0;
end
always@(*)
begin

    for( i=1;i<=16;i=i+1)
    begin 
        P[1][i+1]=A[i]^B[i]; 
        G[1][i+1]=A[i]&B[i]; 
    end       
    k=1;
    P[9][2] = P[1][2];
    G[9][2] = G[1][2];
    
    for(j=2;j<=5;j=j+1)
    begin
        for(i=2+k;i<=17;i=i+1)
        begin
            P[j][i]=P[j-1][i]&P[j-1][i-k];
            G[j][i]=(P[j-1][i]&G[j-1][i-k])|(G[j-1][i]);   
            P[9][i]=P[j][i];
            G[9][i]=G[j][i];         
        end
        k=2**(j-1);
    end
    Carry_Out[1]=Carry_in;
    
    for(i=2;i<=17;i=i+1)
    begin
         Carry_Out[i]=(Carry_in&P[9][i])|G[9][i];
         Sum[i-1]=Carry_Out[i-1]^P[1][i];
    end    
    Sum[17] = Carry_Out[17];
end
endmodule


    
    
    
    

