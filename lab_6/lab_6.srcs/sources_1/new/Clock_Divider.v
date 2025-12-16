module Clock_Divider
(
    input CLK,
    input Reset,
    output T_10ms_Tick // The 10ms pulse (100 Hz)
);
    
    localparam MAX_COUNT = 999999;
    localparam COUNT_WIDTH = 20; 

    // T_10ms_Tick must be a 'reg' because it is assigned within an always block
    reg T_10ms_Tick; 
    reg [COUNT_WIDTH-1:0] counter = 0;

    always @(posedge CLK) begin
        if (Reset) begin
            counter <= 0;
            T_10ms_Tick <= 0;
        end else begin
            if (counter == MAX_COUNT) begin
                counter <= 0;
                T_10ms_Tick <= 1; // Assert pulse for one clock cycle
            end else begin
                counter <= counter + 1;
                T_10ms_Tick <= 0;
            end
        end
    end

endmodule


