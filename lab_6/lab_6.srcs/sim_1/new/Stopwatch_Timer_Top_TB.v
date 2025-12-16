`timescale 1ns / 1ps

module Stopwatch_Timer_Top_TB;

    // --- Testbench Signals ---
    reg CLK100MHZ;
    reg RST_SW;
    reg [1:0] Mode_SW;
    reg [7:0] Preset_SW;
    reg StartStop_BTN;
    reg Reset_BTN;

    wire [6:0] seg;
    wire [3:0] an;
    wire dp;

    // --- Instantiate DUT ---
    Stopwatch_Timer_Top DUT (
        .CLK100MHZ(CLK100MHZ),
        .RST_SW(RST_SW),
        .Mode_SW(Mode_SW),
        .Preset_SW(Preset_SW),
        .StartStop_BTN(StartStop_BTN),
        .Reset_BTN(Reset_BTN),
        .seg(seg),
        .an(an),
        .dp(dp)
    );

    // --- Clock Generation (100 MHz) ---
    initial begin
        CLK100MHZ = 0;
        forever #5 CLK100MHZ = ~CLK100MHZ;   // 10 ns period
    end

    // --- Test Sequence ---
    initial begin
        // Initialize signals
        RST_SW = 1;
        Mode_SW = 2'b00;
        Preset_SW = 8'b0000_0000;
        StartStop_BTN = 0;
        Reset_BTN = 0;

        #20;
        RST_SW = 0;   // release reset

        // -------------------------------------------------------
        // MODE 0: COUNT UP FROM 00.00
        // -------------------------------------------------------
        Mode_SW   = 2'b00;
        Preset_SW = 8'b0000_0000;

        // Start
        StartStop_BTN = 1; #5; StartStop_BTN = 0;

        // Short run
        #200;

        // Stop
        StartStop_BTN = 1; #5; StartStop_BTN = 0;

        // Reset
        Reset_BTN = 1; #5; Reset_BTN = 0;

        #50;

        // -------------------------------------------------------
        // MODE 1: COUNT DOWN FROM 99.99
        // -------------------------------------------------------
        Mode_SW   = 2'b01;
        Preset_SW = 8'b1001_1001;

        StartStop_BTN = 1; #5; StartStop_BTN = 0;
        #200;
        StartStop_BTN = 1; #5; StartStop_BTN = 0;
        Reset_BTN = 1; #5; Reset_BTN = 0;

        #50;

        // -------------------------------------------------------
        // MODE 2: COUNT UP FROM EXTERNALLY LOADED VALUE
        // -------------------------------------------------------
        Mode_SW   = 2'b10;
        Preset_SW = 8'b0101_0011; // 53 seconds

        StartStop_BTN = 1; #5; StartStop_BTN = 0;
        #200;
        StartStop_BTN = 1; #5; StartStop_BTN = 0;
        Reset_BTN = 1; #5; Reset_BTN = 0;

        #50;

        // -------------------------------------------------------
        // MODE 3: COUNT DOWN FROM EXTERNALLY LOADED VALUE
        // -------------------------------------------------------
        Mode_SW   = 2'b11;
        Preset_SW = 8'b0110_0100; // 64 seconds

        StartStop_BTN = 1; #5; StartStop_BTN = 0;
        #200;
        StartStop_BTN = 1; #5; StartStop_BTN = 0;
        Reset_BTN = 1; #5; Reset_BTN = 0;

        #50;

        $finish;
    end

endmodule
