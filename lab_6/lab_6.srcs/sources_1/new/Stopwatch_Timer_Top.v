module Stopwatch_Timer_Top
(
    // Clock and Reset
    input CLK100MHZ,       
    input RST_SW,          

    // User Inputs
    input [1:0] Mode_SW,   
    input [7:0] Preset_SW, 
    input StartStop_BTN,   
    input Reset_BTN,       

    // 7-Segment Display Outputs
    output [6:0] seg,      
    output [3:0] an,       
    output dp              
);

    // --- Internal Signals - Must be 'wire' as they are outputs of instantiated modules ---
    wire T_10ms_Tick;            
    wire CountEN, Load, Clr, Dir; 
    wire [3:0] M0_BCD, M1_BCD, S0_BCD, S1_BCD; 
    wire Time_Is_Max, Time_Is_Min;           

    // --- Debounced Signals ---
    wire StartStop_PULSE;      
    wire Reset_PULSE;          

    // 1. Clock Divider Instantiation
    Clock_Divider Clock_Div_Inst (
        .CLK     (CLK100MHZ),
        .Reset   (RST_SW), 
        .T_10ms_Tick (T_10ms_Tick)
    );

    // 2. Debouncer Instantiation (Start/Stop)
    Debouncer Debouncer_SS_Inst (
        .CLK          (CLK100MHZ),
        .Reset        (RST_SW),
        .Button_In    (StartStop_BTN),
        .Button_PULSE (StartStop_PULSE)
    );
    
    // 3. Debouncer Instantiation (Reset/Load)
    Debouncer Debouncer_RST_Inst (
        .CLK          (CLK100MHZ),
        .Reset        (RST_SW),
        .Button_In    (Reset_BTN),
        .Button_PULSE (Reset_PULSE)
    );
    

    // 4. Controller FSM Instantiation
    Controller_FSM Controller_Inst (
        .CLK           (CLK100MHZ),
        .T_10ms_Tick   (T_10ms_Tick),
        .Mode          (Mode_SW),
        .StartStop     (StartStop_PULSE), 
        .Reset_Btn     (Reset_PULSE),     
        .Time_Is_Max   (Time_Is_Max),
        .Time_Is_Min   (Time_Is_Min),
        .CountEN       (CountEN),
        .Load          (Load),
        .Clr           (Clr),
        .Dir           (Dir)
    );

    // 5. Datapath Instantiation
    Datapath Datapath_Inst (
        .CLK           (CLK100MHZ),
        .T_10ms_Tick   (T_10ms_Tick),
        .CountEN       (CountEN),
        .Load          (Load),
        .Clr           (Clr),
        .Dir           (Dir),
        .Preset_S1     (Preset_SW[7:4]),
        .Preset_S0     (Preset_SW[3:0]),
        .M0_BCD        (M0_BCD),
        .M1_BCD        (M1_BCD),
        .S0_BCD        (S0_BCD),
        .S1_BCD        (S1_BCD),
        .Time_Is_Max   (Time_Is_Max),
        .Time_Is_Min   (Time_Is_Min)
    );

    // 6. Display Driver Instantiation
    Display_Driver Display_Driver_Inst (
        .CLK       (CLK100MHZ),
        .Reset     (RST_SW),
        .S1_BCD    (S1_BCD),
        .S0_BCD    (S0_BCD),
        .M1_BCD    (M1_BCD),
        .M0_BCD    (M0_BCD),
        .segment   (seg),
        .anode     (an)
    );

    // 7. Decimal Point Connection 
    // dp is an output of the Top Module, so it must be driven by an 'assign'
    assign dp = an[1]; 

endmodule






