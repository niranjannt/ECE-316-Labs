module Display_Driver
(
    input CLK,               
    input Reset,

    // BCD Inputs from Datapath
    input [3:0] S1_BCD,      
    input [3:0] S0_BCD,      
    input [3:0] M1_BCD,      
    input [3:0] M0_BCD,      

    // Outputs to 7-Segment Display - Must be 'reg' as they are assigned in always blocks
    output [6:0] segment,    
    output [3:0] anode       
);

    // --- Signals assigned in always blocks must be 'reg' ---
    reg [6:0] segment;    
    reg [3:0] anode;      
    reg [16:0] Mux_Counter = 0;
    reg Mux_Tick = 0;
    reg [1:0] Digit_Select = 0; 
    reg [3:0] Display_Data; 

    localparam MUX_RATE = 500; 
    localparam MUX_MAX = (100000000 / MUX_RATE) / 4 - 1; // ~50k

    // 1. Multiplexing Clock Divider Logic
    always @(posedge CLK) begin
        if (Reset) begin
            Mux_Counter <= 0;
            Mux_Tick <= 0;
        end else if (Mux_Counter == MUX_MAX) begin
            Mux_Counter <= 0;
            Mux_Tick <= 1'b1;
        end else begin
            Mux_Counter <= Mux_Counter + 1'b1;
            Mux_Tick <= 1'b0;
        end
    end

    // 2. Digit Selection (Anode) 
    always @(posedge CLK) begin
        if (Reset) begin
            Digit_Select <= 2'b00;
        end else if (Mux_Tick) begin
            Digit_Select <= Digit_Select + 1'b1;
        end
    end

    // Assign Anode enables (active low) based on selection
    always @(*) begin
        anode = 4'b1111; 
        case (Digit_Select)
            2'b00: anode = 4'b1110; // S1 
            2'b01: anode = 4'b1101; // S0 
            2'b10: anode = 4'b1011; // M1 
            2'b11: anode = 4'b0111; // M0 
            default: anode = 4'b1111;
        endcase
    end

    // 3. BCD Input Selection
    always @(*) begin
        case (Digit_Select)
            2'b00: Display_Data = S1_BCD;
            2'b01: Display_Data = S0_BCD;
            2'b10: Display_Data = M1_BCD;
            2'b11: Display_Data = M0_BCD;
            default: Display_Data = 4'hF; 
        endcase
    end

    // 4. BCD to 7-Segment Decoder
    always @(*) begin
        case (Display_Data)
            4'h0: segment = 7'b1000000; // 0
            4'h1: segment = 7'b1111001; // 1
            4'h2: segment = 7'b0100100; // 2
            4'h3: segment = 7'b0110000; // 3
            4'h4: segment = 7'b0011001; // 4
            4'h5: segment = 7'b0010010; // 5
            4'h6: segment = 7'b0000010; // 6
            4'h7: segment = 7'b1111000; // 7
            4'h8: segment = 7'b0000000; // 8
            4'h9: segment = 7'b0010000; // 9
            default: segment = 7'b1111111; // Blank 
        endcase
    end

endmodule


