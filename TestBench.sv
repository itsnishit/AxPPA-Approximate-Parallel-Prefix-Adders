`timescale 1ns/1ps
/*class generator;
randc logic [16:1] A;
randc logic [16:1] B;
randc logic Carry_in;
logic [16:0] Carry_Out;
logic [16:1] Sum;
logic [16:1] error;
endclass*/

module skalanskytb;
reg [16:1] A;
reg [16:1] B;
reg Carry_in;
wire [16:0] Carry_Out;
wire [17:1] Sum;
reg [17:1] error[9999:0];
Brent_Kung_Approx first( A, B, Carry_in,Carry_Out, Sum);
integer i;
integer count;
reg [17:1] add;
reg [17:1]  e;
real mred[9999:0];
//real add;
//function [17:1] add (input [16:1] a,b,input c);
//begin
//add = a+b+c;
//end
//endfunction
initial begin
e=0;
count=0;

for(i=0;i<10000;i=i+1) begin
A=$urandom();
B=$urandom();
Carry_in=$urandom();
add = A+B+Carry_in;
#1;
if((add-Sum !=0)) begin
if (add>Sum) begin
//mred[i] = (add-Sum)/add;
error[i]=(add-Sum);
end
else begin
error[i] = (Sum-add);
//mred[i] = (Sum-add)/add;
end


count=count+1;
$display("your add is:%0d",add);
$display("your error is:%0d",error[i]);
end
else
error[i]=0;
#1;
e = e + error[i];
#10;	

end
$display("No. of errors ar :%0d",count);




//for (i=0;i<10000;i=i+1) begin
//e = e+ error[i];
//end

$display("Total error :%0d",e);





#200000;
$finish();
end
endmodule
