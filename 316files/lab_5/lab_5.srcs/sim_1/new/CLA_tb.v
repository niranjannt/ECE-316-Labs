`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2025 11:18:06 AM
// Design Name: 
// Module Name: CLA_tb
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


module CLA_tb;
reg clk;
reg enable;
reg[3:0] A;
reg[3:0] B;
reg Cin;
wire [4:0] Q;
wire enable_led;

CLA_4bits DUT (
  .clk(clk),
  .enable(enable),
  .A(A),
  .B(B),
  .Cin(Cin),
  .Q(Q),
  .enable_led(enable_led) 
  );

always #15 clk = ~clk;
initial begin
 clk = 0;
enable = 1;
#50
A = 4'b0000; 
B = 4'b0101; 
Cin = 1'b0; 
#100
            
A = 4'b0101; 
B = 4'b0111; 
Cin = 1'b0; 
#100
            
A = 4'b1000; 
B = 4'b0111; 
Cin = 1'b1; 
#100 
            
A = 4'b1001; 
B = 4'b0100; 
Cin = 1'b0; 
#100
            
A = 4'b1000; 
B = 4'b1000; 
Cin = 1'b1; 
#100
            
A = 4'b1101; 
B = 4'b1010;
Cin = 1'b1; 
#100
            
A = 4'b1110;
 B = 4'b1111; 
 Cin = 1'b0; 
 #100 $finish;
end  
endmodule
