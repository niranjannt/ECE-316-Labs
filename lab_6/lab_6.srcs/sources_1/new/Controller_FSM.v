module Controller_FSM
(
    // Inputs
    input CLK,
    input T_10ms_Tick, 
    input [1:0] Mode,      
    input StartStop,   
    input Reset_Btn,   
    input Time_Is_Max, 
    input Time_Is_Min, 

    // Outputs - Must be declared as 'reg' because they are assigned in an always block
    output CountEN,
    output Load,
    output Clr,
    output Dir         
);

    // --- State Definitions ---
    localparam [1:0] INIT = 2'b00, PRESET_LOAD = 2'b01, COUNT_UP = 2'b10, COUNT_DOWN = 2'b11;
    reg [1:0] CS, NS;
    
    // Outputs assigned within the always @(*) block must be declared as 'reg'
    reg CountEN;
    reg Load;
    reg Clr;
    reg Dir;
    
    // --- Sequential Logic (State Register) ---
    always @(posedge CLK) begin
        CS <= NS;
    end

    // --- Combinational Logic (Next State and Output) ---
    always @(*) begin
        // Default Outputs (Safety/Stop)
        NS = CS;
        CountEN = 1'b0;
        Load = 1'b0;
        Clr = 1'b0;
        Dir = 1'b0; 

        case (CS)
            INIT: begin
                // MODE 0 (Count Up from 00.00)
                if (Mode == 2'b00) begin
                    Dir = 1'b1; // Up
                    if (Reset_Btn) begin
                        Clr = 1'b1; // Reset to 00.00
                        NS = INIT;
                    end else if (StartStop) begin
                        NS = COUNT_UP;
                    end
                // MODE 1 (Count Down from 99.99)
                end else if (Mode == 2'b01) begin
                    Dir = 1'b0; // Down
                    if (Reset_Btn) begin
                        Load = 1'b1; // Reset to 99.99
                        NS = INIT;
                    end else if (StartStop) begin
                        NS = COUNT_DOWN;
                    end
                // MODE 2/3 (Load Preset) - Only triggers entry into PRESET_LOAD from INIT
                end else begin
                    Load = 1'b1; // Load Preset value
                    NS = PRESET_LOAD;
                end
            end

            PRESET_LOAD: begin
                // Preset modes require Dir to be set correctly for Datapath Load logic
                Dir = (Mode == 2'b10) ? 1'b1 : 1'b0; 

                // Reset/Reload Preset
                if (Reset_Btn) begin
                    Load = 1'b1;
                    NS = PRESET_LOAD;
                // Start Counting
                end else if (StartStop) begin
                    if (Mode == 2'b10) begin
                        NS = COUNT_UP;
                    end else begin // Mode 3
                        NS = COUNT_DOWN;
                    end
                end
            end

            COUNT_UP: begin
                Dir = 1'b1; // Up
                if (Reset_Btn) begin
                    Clr = 1'b1;
                    NS = INIT; 
                end else if (StartStop || Time_Is_Max) begin
                    NS = INIT; 
                end else if (T_10ms_Tick) begin
                    CountEN = 1'b1;
                    NS = COUNT_UP; 
                end
            end

            COUNT_DOWN: begin
                Dir = 1'b0; // Down
                if (Reset_Btn) begin
                    Load = 1'b1;
                    NS = PRESET_LOAD; 
                end else if (StartStop || Time_Is_Min) begin
                    NS = INIT; 
                end else if (T_10ms_Tick) begin
                    CountEN = 1'b1;
                    NS = COUNT_DOWN; 
                end
            end

        endcase
    end
endmodule


