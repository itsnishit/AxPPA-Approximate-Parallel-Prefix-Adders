module Ladner_Fischer_16_K6(A,B,Cin,Sum);
    input [15:0] A,B;
    input Cin;
    output reg [15:0] Sum;
    reg [16:0] Cout;
    reg P[16:0][16:0];
    reg G[16:0][16:0];
    integer i;

    always @(*) begin
        Cout = 0;
        Sum = 0;
        for( i=0;i<=15;i=i+1)
        begin 
            P[1][i]=A[i]^B[i]; 
            G[1][i]=A[i]&B[i]; 
        end
        
        
       
        P[2][7] = P[1][6]&P[1][7];
        G[2][7] = (G[1][6]&P[1][7])|G[1][7];
        P[2][9] = P[1][9]&P[1][8];
        G[2][9] = (G[1][8]&P[1][9])|G[1][9];
        P[2][11] = P[1][11]&P[1][10];
        G[2][11] = (G[1][10]&P[1][11])|G[1][11];
        P[2][13] = P[1][12]&P[1][13];
        G[2][13] = (G[1][12]&P[1][13])|G[1][13];
        P[2][15] = P[1][15]&P[1][14];
        G[2][15] = (G[1][14]&P[1][15])|G[1][15];
        
        
        
        P[3][9] = P[2][7]&P[2][9];
        G[3][9] = (G[2][7]&P[2][9])|G[2][9];
        P[3][12] = P[1][12]&P[2][11];
        G[3][12] = (G[2][11]&P[1][12])|G[1][12];
        P[3][13] = P[2][11]&P[2][13];
        G[3][13] = (G[2][11]&P[2][13])|G[2][13];        
       
        
        P[4][0] = P[1][0];
        G[4][0] = G[1][0];
        P[4][1] = P[1][1];
        G[4][1] = G[1][1];
        P[4][2] = P[1][2];
        G[4][2] = G[1][2];
        P[4][3] = P[1][3];
        G[4][3] = G[1][3];
        P[4][4] = P[1][4];
        G[4][4] = G[1][4];
        P[4][5] = P[1][5];
        G[4][5] = G[1][5];
        P[4][6] = P[1][6];
        G[4][6] = G[1][6];
        P[4][7] = P[2][7];
        G[4][7] = G[2][7];
        
        
        
        P[4][8] = P[2][7]&P[1][8];
        G[4][8] = (P[1][8]&G[2][7])|G[1][8];
        P[4][9] = P[3][9];
        G[4][9] = G[3][9];
        P[4][10] = P[1][10]&P[4][9];
        G[4][10] = (P[1][10]&G[4][9])|G[1][10];
        P[4][11] = P[2][11]&P[3][9];
        G[4][11] = (P[2][11]&G[3][9])|G[2][11];
        P[4][12] = P[4][11]&P[3][12]; //
        G[4][12] = (P[3][12]&G[4][11])|G[3][12]; //
        P[4][13] = P[3][9]&P[3][13];
        G[4][13] = (G[3][9]&P[3][13])|G[3][13];
        
        P[4][14] = P[1][14];
        G[4][14] = G[1][14];
        P[4][15] = P[2][15];
        G[4][15] = G[2][15];
       
        
//        Cout[0] = (Cin&P[4][0])|G[4][0];
//        Sum[0] = A[0]^B[0]^Cin;
        Cout[0] = Cin;
        Sum[0] = P[1][0];
        
        
         for (i=1;i<=5;i=i+1) begin
            Cout[i+1] = G[4][i+1];
            Sum[i] = A[i]^B[i]^Cout[i];
        end
        
        /*for (i=1;i<=7;i=i+1) begin
            Cout[i+1] = G[4][i+1];
            Sum[i] = A[i]^B[i]^Cout[i];
        end*/
        
        for (i=6;i<=15;i=i+1) begin
            Cout[i+1] = (Cout[5]&P[4][i])|G[4][i];
            Sum[i] = A[i]^B[i]^Cout[i];
        end
        
    end
endmodule