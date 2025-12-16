`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 02:37:29 PM
// Design Name: 
// Module Name: datapath
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


module datapath(
    input load,
    input  clear,
    input [1:0] select,
    output reg [13:0] count,
    output max,
    output zero,
    input [7:0] prescale,
    input clk
    );
assign max = (count == 9998);        
assign zero = (count == 1);
always @(posedge clk)
begin
    if (clear) begin
       count <= 0;
       end
    else if(load) begin
    case (select)
        2'd0: count <= 14'd9999;
        2'd1: count <= count + 1;
        2'd2: count <= count - 1;
        2'd3: begin
        if(prescale[7:4]<=9 && prescale[3:0]<=9)
              count <= prescale[7:4] * 1000 + prescale[3:0] * 100;
              else
              count <= count;
end
endcase

end
end        
endmodule
