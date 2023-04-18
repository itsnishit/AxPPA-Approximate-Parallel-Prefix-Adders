module filterfir (clk,rst,x,dataout);
    input [15:0]x;
    input clk,rst;
    output [15:0]dataout;
    
    wire [15:0]d1,d2,d3;
    wire [15:0]m1,m2,m3,m4,m5;
    wire [15:0]d11,d12,d13,d14;
    
    parameter h0=3'b101;
    parameter h1=3'b100;
    parameter h2=3'b011;
    parameter h3=3'b010;
    parameter h4=3'b001;
    
    assign m1=x>>h0;
    dff u2(clk,rst,x,d11);
    assign m2=d11>>h1;
    
    Kogge_Stone t1 (m1,m2,0,d1);
    // assign d1=m1+m2;
    dff u4(clk,rst,d11,d12);
    assign m3=d12>>h2;
    
    Kogge_Stone t2 (d1,m3,0,d2);
    // assign d2=d1+m3;
    dff u6(clk,rst,d12,d13);
    assign m4=d13>>h3;
    
    Kogge_Stone t3 (d2,m4,0,d3);
    // assign d3=d2+m4;
    dff u8(clk,rst,d13,d14);
    assign m5=d14>>h4;
    
    Kogge_Stone t4 (d3,m5,0,dataout);
    // assign dataout=d3+m5;
    
endmodule

module dff(clk,rst,d,q);// sub module d flipflop
    input clk,rst;
    input [15:0]d;
    output [15:0]q;
    
    reg [15:0]q;
    
    always@(posedge clk) begin
        if(rst==1) begin
            q=0;
            end
        else begin
            q=d;
            end
        end
    
endmodule


module Kogge_Stone(input [16:1] A, input [16:1] B, input Carry_in,output reg [16:1] Sum);
reg P[9:1][17:1];
reg G[9:1][17:1];
reg [17:1] Carry_Out;
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
    //Sum[17] = Carry_Out[17];
end
endmodule
