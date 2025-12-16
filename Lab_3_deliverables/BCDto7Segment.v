`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2025 12:32:48 PM
// Design Name: 
// Module Name: BCDto7Segment
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


module BCDto7Segment(
    input a,
    input b,
    input c,
    input d,
    output segment_a,
    output segment_b,
    output segment_c,
    output segment_d,
    output segment_e,
    output segment_f,
    output segment_g,
    output AN1,
    output AN2,
    output AN3,
    output AN0
    );
    
    wire a_bar;
    wire b_bar;
    wire c_bar;
    wire d_bar;
    not(d_bar, d);
    not(c_bar, c);
    not(b_bar, b);
    not(a_bar, a);
    
    wire dc;
    and(dc, c, d);
    wire db;
    and(db, d, b);
    wire cbnotanot;
    and(cbnotanot, c, b_bar, a_bar);
    wire dnotcnotbnota;
    and(dnotcnotbnota, d_bar, c_bar, b_bar, a);
    wire segmentaon;
    or(segment_a, dc, db, cbnotanot, dnotcnotbnota);
    //not(segment_a, segmentaon);
    wire cbnota;
    and(cbnota, c, b_bar, a);
    wire cbanot;
    and (cbanot, c, b, a_bar);
    wire segmentbon;
    or(segment_b, dc, db, cbnota, cbanot);
    //not(segment_b, segmentbon);
    wire cnotbanot;
    and(cnotbanot, c_bar, b, a_bar);
    wire segmentcon;
    or(segment_c, dc, db, cnotbanot);
    //not(segment_c, segmentcon);
    wire cba;
    and(cba, c, b, a);
    wire segmentdon;
    or(segment_d, dnotcnotbnota, dc, db, cbnotanot, cba);
    //not(segment_d, segmentdon);
    wire cbnot;
    and(cbnot, c, b_bar);
    wire segmenteon;
    or(segment_e, db, cbnot, a);
    //not(segment_e, segmenteon);
    wire dnotcnota;
    wire ba;
    wire cnotb;
    and(dnotcnota, d_bar, c_bar, a);
    and (ba, b, a);
    and(cnotb, c_bar, b);
    wire segmentfon;
    or(segment_f, dnotcnota, ba, cnotb, dc);
    //not(segment_f, segmentfon);    
    wire dnotcnotbnot;
    and(dnotcnotbnot, d_bar, c_bar, b_bar);
    wire segmentgon;
    or(segment_g, dnotcnotbnot, dc, db, cba);
    //not(segment_g, segmentgon);
    assign AN3 = 1'b1;
   assign AN2 = 1'b1;
   assign AN1 = 1'b0; 
   assign AN0 = 1'b1;

    
endmodule
