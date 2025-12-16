`timescale 1ns / 1ps

module CLA_4bits(
input clk,
input enable,
input [3:0] A, 
input [3:0] B,
input Cin,
output [4:0] Q,
output enable_led
    );
    
    
wire [3:0] G, P, S;
wire [4:0] C;
assign P = A ^ B;
assign G = A & B;
assign C[0]= Cin;
assign C[1]= ((G[0]) | (C[0] & P[0]));
assign C[2]= ((G[1]) | (G[0] &  P[1]) | (C[0] & P[0] & P[1]));
assign C[3]= ((G[2]) | (G[1] &  P[2]) | (G[0] & P[1] & P[2]) | (C[0] & P[0] & P[1] & P[2]));
assign C[4]= ((G[3]) | (G[2] &  P[3]) | (G[1] & P[2] & P[3]) | (G[0] & P[1] & P[2] & P[3]) | (C[0] & P[0] & P[1] & P[2] & P[3] ));
assign S = P ^ C;
CLAregister_logic r0(clk, enable, {C[4], S}, Q);
assign enable_led = enable;

endmodule