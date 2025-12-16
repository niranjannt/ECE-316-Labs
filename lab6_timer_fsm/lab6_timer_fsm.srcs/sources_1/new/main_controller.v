`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2025 08:48:27 PM
// Design Name: 
// Module Name: main_controller
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


module main_controller(
    input [7:0] prescale,
    input clk,
    input reset,
    input start,
    input  [1:0] mode

    );

wire fsmclock;
wire dispclock;  
wire maxcount;
wire zerocount;  
wire load_w;
wire clear_w;
wire [1:0] select_w;
wire [13:0] count_w;


fsm_clk_div clkfsm(
.clk(clk),
.reset(reset),
.clk_out(fsmclock)
);  


lights_clk_div clkdisplay(
.clk(clk),
.reset(reset),
.clk_out(dispclock)
);  

 state_machine HLSM(
.mode(mode),
.start(start),
.reset(reset),
.clk(fsmclk),
.max(maxcount),
.zero(zerocount),
.load(load_w),
.clear(clear_w),
.select(select_w)


);

datapath datapath(
.load(load_w),
.clear(clear_w),
.select(select_w),
.count(count_w),
.max(maxcount),
.zero(zerocount),
.prescale(prescale),
.clk(fsmclock)



);


endmodule
