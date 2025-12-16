`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/26/2025 08:41:31 PM
// Design Name: 
// Module Name: lights_clk_div
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


module lights_clk_div(
input clk,
input reset,
output reg clk_out

    );
        
reg [25:0] COUNT;


always @(posedge clk)
begin
if(reset) begin
    COUNT<=0;
    clk_out<=0;
    end
else begin
if(COUNT==49_999) begin
clk_out<=~clk_out;
COUNT<=0;
end
else begin
    COUNT<=COUNT+1;

end
end
end
endmodule


