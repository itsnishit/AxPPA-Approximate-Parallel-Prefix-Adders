`timescale 1ns / 1ps

module tb;
wire [15:0] Sum;
//wire [9:1] Carry_Out;
reg [15:0] A,B;
reg Cin;

Ladner_Fischer_16_K8 dut( A, B, Cin,Sum);

initial 
begin
        
        A=16'd10; B=16'd10; Cin=0;
    #10 A=16'd98; B=16'd10; Cin=0;
    #10 A=16'd100; B=16'd20; Cin=0;
    #10 A=16'd2; B=16'd185; Cin=0;
    #10 A=16'd10; B=16'd30; Cin=0;
    #10 A=16'd2; B=16'd150; Cin=0;
    #10 A=16'd4000; B=16'd4000; Cin=0;
    #10 A=16'd8000; B=16'd4000; Cin=0;
    #10 A=16'd15000; B=16'd5000; Cin=0;
    #10 A=16'd20000; B=16'd248; Cin=0;
    #10 A=16'd30000; B=16'd30000; Cin=0;
    
   // #10 A=8'b01001010; B=8'b11110001; Cin=1;
   // #10 A=8'b00011010; B=8'b10010001; Cin=0;
   #10 $finish;
end

endmodule