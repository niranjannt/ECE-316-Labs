`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2025 05:47:01 PM
// Design Name: 
// Module Name: Debouncer
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


module Debouncer
#(
    parameter STABLE_COUNT = 2000000 
)
(
    input CLK,
    input Reset,
    input Button_In,       // Raw button input
    output Button_PULSE    // Clean, one-cycle pulse output
);
    // All signals assigned in an always block must be declared as 'reg'
    reg Button_PULSE;
    reg [20:0] counter = 0;      
    reg synced_signal = 0;       
    reg debounced_signal = 0;    
    reg prev_debounced = 0;      

    // 1. Synchronize the input to the CLK domain 
    always @(posedge CLK) begin
        synced_signal <= Button_In;
    end

    // 2. Delay and Debounce Logic
    always @(posedge CLK) begin
        if (Reset) begin
            counter <= 0;
            debounced_signal <= 0;
        end else begin
            if (synced_signal != debounced_signal) begin
                counter <= 0;
            end else if (counter < STABLE_COUNT) begin
                counter <= counter + 1;
            end else begin
                debounced_signal <= synced_signal;
            end
        end
    end

    // 3. Edge Detection for the Output Pulse
    always @(posedge CLK) begin
        prev_debounced <= debounced_signal;
        Button_PULSE <= (debounced_signal == 1'b1) && (prev_debounced == 1'b0);
    end

endmodule


