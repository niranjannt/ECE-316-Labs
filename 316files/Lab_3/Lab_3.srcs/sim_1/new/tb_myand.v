`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/12/2025 05:46:58 PM
// Design Name: 
// Module Name: tb_decoder
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

`timescale 1ns / 1ps

module tb_myand;

    reg a, b;
    wire out;

    // dut: design under test
myAND dut(.a(a), .b(b), .out(out));

    // test without checker
    initial begin 
        a = 0; b = 0;
        #50            
        a= 0; b= 1;    
        #50
        a = 1; b = 0;
        #50
        a =1; b= 1;
        #50
        $finish;

    end

endmodule
