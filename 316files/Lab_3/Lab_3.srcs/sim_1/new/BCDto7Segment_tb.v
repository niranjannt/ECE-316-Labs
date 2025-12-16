`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2025 01:36:38 PM
// Design Name: 
// Module Name: BCDto7Segment_tb
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


module BCDto7Segment_tb;
    reg a;
    reg b;
    reg c;
    reg d;
    wire seg_a;
    wire seg_b;
    wire seg_c;
    wire seg_d;
    wire seg_e;
    wire seg_f;
    wire seg_g;
    wire AN1;
    wire AN2;
    wire AN3;
    wire AN0;
    
    BCDto7Segment dut (.a(a), .b(b), .c(c), .d(d), .segment_a(seg_a), .segment_b(seg_b), .segment_c(seg_c), .segment_d(seg_d), .segment_e(seg_e), .segment_f(seg_f), .segment_g(seg_g), .AN1(AN1), .AN2(AN2), .AN3(AN3), .AN0(AN0));
    initial begin
        a = 0; b = 0; c = 0; d = 0; #50;  
        a = 1; b = 0; c = 0; d = 0; #50;  
        a = 0; b = 1; c = 0; d = 0; #50;  
        a = 1; b = 1; c = 0; d = 0; #50;  
        a = 0; b = 0; c = 1; d = 0; #50;  
        a = 1; b = 0; c = 1; d = 0; #50;  
        a = 0; b = 1; c = 1; d = 0; #50;  
        a = 1; b = 1; c = 1; d = 0; #50;  
        a = 0; b = 0; c = 0; d = 1; #50;  
        a = 1; b = 0; c = 0; d = 1; #50;  
        a = 0; b = 1; c = 0; d = 1; #50;  
        a = 1; b = 1; c = 0; d = 1; #50;  
        a = 0; b = 0; c = 1; d = 1; #50;  
        a = 1; b = 0; c = 1; d = 1; #50;  
        a = 0; b = 1; c = 1; d = 1; #50;  
        a = 1; b = 1; c = 1; d = 1; #50;  
    end
endmodule
