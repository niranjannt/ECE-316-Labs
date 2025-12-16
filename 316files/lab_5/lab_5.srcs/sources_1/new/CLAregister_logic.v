`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2025 12:01:52 AM
// Design Name: 
// Module Name: CLAregister_logic
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


module CLAregister_logic(
input clk,
input enable,
input [4:0] Data,
output reg [4:0] Q
    );
    
always @(posedge clk) begin
if(enable) begin
Q <= Data;

end



end
    
endmodule
