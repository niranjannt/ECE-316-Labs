`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2025 06:23:07 PM
// Design Name: 
// Module Name: fourtoonemux
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

//Structural Modelling

module fourtoonemux(
input i0, i1, i2, i3, s1, s0,
output d
);
wire i0select, i1select, i2select, i3select;


and(i0select ,i0, (~s1), (~s0));
and(i1select, i1, (~s1), (s0));
and(i2select, i2, s1, (~s0));
and(i3select, i3 ,s1, s0);
or(d, i0select, i1select, i2select, i3select);
endmodule



//Behavioral Modelling

//module fourtoonemux(
//input i0, i1, i2, i3, s1, s0,
//output reg d
//);
//always @(*) begin
//if((s1==0) && (s0==0)) d = i0;
//else if((s1==0) && (s0==1)) d = i1;
//else if((s1==1) && (s0==0)) d = i2;
//else if((s1==1) && (s0==1)) d = i3;

//end

//endmodule


