`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2025 05:24:10 PM
// Design Name: 
// Module Name: RCA_4bits
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


module RCA_4bits(
input clk,
input enable, 
input [3:0] A,
input [3:0] B,
input Cin,
output [4:0] Q,
output enable_led
    );
wire C1, C2, C3;
assign enable_led = enable;
wire [3:0] Sum;
wire Cout;
full_adder fa0(A[0], B[0], Cin, Sum[0], C1);
full_adder fa1(A[1], B[1], C1, Sum[1], C2);
full_adder fa2(A[2], B[2], C2, Sum[2], C3);
full_adder fa3(A[3], B[3], C3, Sum[3], Cout);

register_logic r0(clk, enable, {Cout, Sum}, Q);

    
endmodule
