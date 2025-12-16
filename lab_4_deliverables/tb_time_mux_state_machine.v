`timescale 1ns / 1ps
////////////////r//////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2025 12:22:49 AM
// Design Name: 
// Module Name: tb_time_mux_state_machine
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


module tb_time_mux_state_machine;

reg clk;
reg reset;
reg [15:0] sw;
wire [3:0] an;
wire [6:0] sseg;
wire slow_clk;
wire [7:0] binary_out;



    time_multiplexing_main DUT (
        .clk(clk),
        .reset(reset),
        .sw(sw),
        .an(an),
        .sseg(sseg),
        .slow_clk(slow_clk),
        .binary_out(binary_out)
    );
    
always #5 clk = ~clk;


initial begin
clk=0;
reset=1;
#50
reset=0;
#50
sw=16'h1234;
#250
sw=16'h9234;
#250
sw=16'h9131;
#250
sw=16'hbCdE;
#550
$stop;

end
endmodule
