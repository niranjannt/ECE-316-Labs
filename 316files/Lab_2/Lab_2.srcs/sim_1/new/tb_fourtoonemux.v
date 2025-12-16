`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2025 06:23:46 PM
// Design Name: 
// Module Name: tb_fourtoonemux
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


module tb_fourtoonemux;
reg i0, i1, i2, i3, s1, s0;
wire d;
fourtoonemux dut (.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s1(s1), .s0(s0), .d(d));
initial begin
i3=0; i2=1; i1=0; i0=0; s1=0; s0=0;
#50
i3=0; i2=1; i1=0; i0=0; s1=0; s0=1;

#50
i3=0; i2=1; i1=0; i0=0; s1=1; s0=0;

#50
i3=0; i2=1; i1=0; i0=0; s1=1; s0=1;

#50
i3=1; i2=0; i1=0; i0=0; s1=0; s0=0;

#50
i3=1; i2=0; i1=0; i0=0; s1=0; s0=1;

#50
i3=1; i2=0; i1=0; i0=0; s1=1; s0=0;

#50
i3=1; i2=0; i1=0; i0=0; s1=1; s0=1;

#50
$finish;
end
endmodule
