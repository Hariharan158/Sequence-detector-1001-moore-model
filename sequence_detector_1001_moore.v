`timescale 1ns/1ps
module sequence_detector_1001_moore (
    input  wire clk,
    input  wire reset,
    input  wire x,
    output reg  z
);

    // State encoding
    parameter S0 = 3'b000;
    parameter S1 = 3'b001;
    parameter S2 = 3'b010;
    parameter S3 = 3'b011;
    parameter S4 = 3'b100;

    reg [2:0] current_state, next_state;

    // State register
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        case (current_state)

            S0: begin
                if (x)
                    next_state = S1;
                else
                    next_state = S0;
            end

            S1: begin
                if (x)
                    next_state = S1;
                else
                    next_state = S2;
            end

            S2: begin
                if (x)
                    next_state = S1;
                else
                    next_state = S3;
            end

            S3: begin
                if (x)
                    next_state = S4;
                else
                    next_state = S0;
            end

            S4: begin
                if (x)
                    next_state = S1;
                else
                    next_state = S2;
            end

            default:
                next_state = S0;

        endcase
    end

    // Moore output
    always @(*) begin
        if (current_state == S4)
            z = 1'b1;
        else
            z = 1'b0;
    end

endmodule
