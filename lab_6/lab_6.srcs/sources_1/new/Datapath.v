module Datapath
(
    // Clock & Control Inputs from Controller
    input CLK,
    input T_10ms_Tick,
    input CountEN, 
    input Load,    
    input Clr,     
    input Dir,     

    // Data Inputs (Preset)
    input [3:0] Preset_S1, 
    input [3:0] Preset_S0, 

    // Time Outputs (Display BCD) - Must be 'wire' or implicitly declared if not driven by 'reg'
    output [3:0] M0_BCD, 
    output [3:0] M1_BCD, 
    output [3:0] S0_BCD, 
    output [3:0] S1_BCD, 

    // Status Outputs to Controller
    output Time_Is_Max, 
    output Time_Is_Min  
);

    // Internal BCD Registers - Must be 'reg' as they are assigned in an always block
    reg [3:0] M0 = 0, M1 = 0, S0 = 0, S1 = 0;

    // Use 'wire' or continuous assign for combinatorial outputs
    wire Time_Is_Max;
    wire Time_Is_Min;

    // Output assignments must use 'assign' or be the 'reg' itself
    assign M0_BCD = M0;
    assign M1_BCD = M1;
    assign S0_BCD = S0;
    assign S1_BCD = S1;

    // Terminal Count Logic
    assign Time_Is_Max = (S1 == 4'd9) && (S0 == 4'd9) && (M1 == 4'd9) && (M0 == 4'd9);
    assign Time_Is_Min = (S1 == 4'd0) && (S0 == 4'd0) && (M1 == 4'd0) && (M0 == 4'd0);


    always @(posedge CLK) begin
        if (Clr) begin
            {S1, S0, M1, M0} <= 16'h0000;
        end else if (Load) begin
            if (Dir == 1'b1) begin
                // Mode 2 Load (Up from Preset - M1/M0 must be 00)
                {S1, S0, M1, M0} <= {Preset_S1, Preset_S0, 4'h0, 4'h0};
            end else begin
                // Mode 1/3 Load (Down from Preset or 99.99)
                {S1, S0, M1, M0} <= {Preset_S1, Preset_S0, 4'h9, 4'h9};
            end
        end else if (CountEN && T_10ms_Tick) begin
            // Counting Logic is enabled on the 10ms tick
            if (Dir == 1'b1) begin
                // --- COUNT UP LOGIC ---
                if (M0 == 4'd9) begin M0 <= 4'd0;
                    if (M1 == 4'd9) begin M1 <= 4'd0;
                        if (S0 == 4'd9) begin S0 <= 4'd0;
                            if (S1 == 4'd9) begin S1 <= 4'd9; // Stops at 99.99
                            end else S1 <= S1 + 1'b1;
                        end else S0 <= S0 + 1'b1;
                    end else M1 <= M1 + 1'b1;
                end else M0 <= M0 + 1'b1;
            end else begin
                // --- COUNT DOWN LOGIC ---
                if (M0 == 4'd0) begin M0 <= 4'd9;
                    if (M1 == 4'd0) begin M1 <= 4'd9;
                        if (S0 == 4'd0) begin S0 <= 4'd9;
                            if (S1 == 4'd0) begin S1 <= 4'd0; // Stops at 00.00
                            end else S1 <= S1 - 1'b1;
                        end else S0 <= S0 - 1'b1;
                    end else M1 <= M1 - 1'b1;
                end else M0 <= M0 - 1'b1;
            end
        end
    end

endmodule


