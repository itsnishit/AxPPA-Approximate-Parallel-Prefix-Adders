`timescale 1ns / 1ns

module Skalansky_Testbench;
wire [16:1] Sum;
wire [16:0] Carry_Out;
reg [16:1] A,B;
reg Carry_in;

Skalansky tb( A, B, Carry_in, Carry_Out, Sum);

initial 
begin
    A=16'h1234; B=16'h1234; Carry_in=0;
   #10 A=16'h1234; B=16'h8902; Carry_in=1;
   #10 A=16'h2562; B=16'hACDF; Carry_in=0;
   #10 A=16'h0000; B=16'h000; Carry_in=1;
   #10 A=16'hFFFF; B=16'hFFFF; Carry_in=0;
   #10 A=16'h7890; B=16'h1020; Carry_in=0;
   #10 A=16'hA234; B=16'h5467; Carry_in=1;
   #10 A=16'h4567; B=16'hABC0; Carry_in=0;
end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
    

endmodule