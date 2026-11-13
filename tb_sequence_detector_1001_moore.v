`timescale 1ns/1ps

module tb_sequence_detector_1001_moore;

    reg clk;
    reg reset;
    reg x;
    wire z;

    // Instantiate DUT
    sequence_detector_1001_moore uut (
        .clk(clk),
        .reset(reset),
        .x(x),
        .z(z)
    );

    // Clock generation
    always #5 clk = ~clk;

    // VCD dump
    initial begin
        $dumpfile("sequence_detector_1001_moore.vcd");
        $dumpvars(0, tb_sequence_detector_1001_moore);
    end

    // Test sequence
    initial begin

        // Initial values
        clk = 0;
        reset = 1;
        x = 0;

        // Reset
        #10;
        reset = 0;

        // Input: 1 0 0 1
        #10 x = 1;
        #10 x = 0;
        #10 x = 0;
        #10 x = 1;

        // Extra bits to check overlapping detection
        #10 x = 0;
        #10 x = 0;
        #10 x = 1;

        // Finish simulation
        #10;
        $finish;

    end

    // Monitor
    initial begin
        $monitor("Time=%0t | Reset=%b | X=%b | State=%b | Z=%b",
                 $time, reset, x, uut.current_state, z);
    end

endmodule
