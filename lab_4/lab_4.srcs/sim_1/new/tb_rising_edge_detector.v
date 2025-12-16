`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2025 10:02:01 PM
// Design Name: 
// Module Name: tb_rising_edge_detector
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


module tb_rising_edge_detector;

reg clk;
reg signal;
reg reset;
wire outedge;


    rising_edge_detector DUT (
        .clk(clk),
        .signal(signal),
        .reset(reset),
        .outedge(outedge)
    );
    
// Instantiate clkdiv

    always #10 clk = ~clk;  // 10 ns period = 100 MHz

 initial begin
 clk = 0;
 signal = 0;
 reset=1;
 #20
 reset=0;
 #200
 signal=1;
 #200 
 signal=0;
 #200
 signal=1;
 #200
 signal=0;
 #200
 signal=1;
 #200
 signal=0;
 #200 $finish;
 end

endmodule
