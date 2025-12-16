`timescale 1ns / 1ps

module state_machine(
    input  [1:0] mode,
    input        start,
    input        reset,
    input        clk,
    input        max,
    input        zero,
    output reg   load,
    output reg   clear,
    output reg [1:0] select
);

reg [3:0] state;
reg [3:0] next_state;

parameter INIT                = 4'd0,
          UPCOUNTZERO        = 4'd1,
          UPPAUSE            = 4'd2,
          UPCOUNT            = 4'd3,
          TOP                = 4'd4,
          UPLOAD             = 4'd5,
          DOWNCOUNTALLNINES  = 4'd6,
          DOWNPAUSE          = 4'd7,
          DOWNCOUNT          = 4'd8,
          BOTTOM             = 4'd9,
          BOTTOMLOAD         = 4'd10;

always @(posedge clk or posedge reset)
begin
    if (reset)
        state <= INIT;
    else
        state <= next_state;
end        

always @(*)
begin
next_state = state;
load = 0;
clear = 0;
select = 0;
    case (state)

        INIT: begin
            load   = 0;
            clear  = 0; 
            select = 0;

            if (mode == 2'd0)
                next_state = UPCOUNTZERO;
            else if (mode == 2'd1)
                next_state = UPLOAD;
            else if (mode == 2'd2)
                next_state = DOWNCOUNTALLNINES;
            else if (mode == 2'd3)
                next_state = BOTTOMLOAD;
        end

        UPCOUNTZERO: begin
            clear  = 1;
            load   = 0;
            select = 0;
            next_state = UPPAUSE;
        end

        UPPAUSE: begin
            load   = 0;
            clear  = 0; 
            select = 0;

            if (start)
                next_state = UPCOUNT;
        end

        UPCOUNT: begin
            load   = 1;
            clear  = 0;
            select = 1;

            if (max)
                next_state = TOP;

            if (start)
                next_state = UPPAUSE;
        end

        TOP: begin
            clear  = 0;
            load   = 0;
            select = 0;
        end

        UPLOAD: begin
            clear  = 0;
            select = 3;
            load   = 1;
            next_state = UPPAUSE;
        end

        DOWNCOUNTALLNINES: begin
            load   = 1;
            select = 0;
            clear  = 0;
            next_state = DOWNPAUSE;
        end

        DOWNPAUSE: begin
            load   = 0;
            select = 0;
            clear  = 0;

            if (start)
                next_state = DOWNCOUNT;
        end

        DOWNCOUNT: begin
            clear  = 0;
            load   = 1;
            select = 2;

            if (zero)
                next_state = BOTTOM;

            if (start)
                next_state = DOWNPAUSE;
        end

        BOTTOM: begin
            load   = 0;
            clear  = 0;
            select = 0;
        end

        BOTTOMLOAD: begin
            clear  = 0;
            select = 3;
            load   = 1;
            next_state = DOWNPAUSE;
        end
    endcase
end

endmodule
