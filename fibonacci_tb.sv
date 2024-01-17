`timescale 1ns/1ns

module fibonacci_tb;

    logic clk; 
    logic reset = 1'b0;
    logic [15:0] din = 16'h0;
    logic start = 1'b0;
    logic [15:0] dout;
    logic done;

    fibonacci fib(clk, reset, din, start, dout, done);

    always begin
        clk = 1'b0;
        #5 clk = 1'b1;
        #5;
    end

    initial begin
        // Reset
        #0 reset = 0;
        #10 reset = 1;
        #10 reset = 0;

        // Test Input of 5
        #10;
        din = 16'd5;
        start = 1'b1;
        #10 start = 1'b0;
        #10 wait (done == 1'b1);
        $display("-----------------------------------------");
        $display("Input: %d", din);
        if (dout === 5)
            $display("CORRECT RESULT: %d, GOOD JOB!", dout);
        else
            $display("INCORRECT RESULT: %d, SHOULD BE: 5", dout);

        // Test Input of 8
        #10;
        din = 16'd8;
        start = 1'b1;
        #10 start = 1'b0;
        #10 wait (done == 1'b1);
        $display("-----------------------------------------");
        $display("Input: %d", din);
        // Add expected result for 8

        // Test Input of 9
        #10;
        din = 16'd9;
        start = 1'b1;
        #10 start = 1'b0;
        #10 wait (done == 1'b1);
        $display("-----------------------------------------");
        $display("Input: %d", din);
        // Add expected result for 9

        // Test Input of 13
        #10;
        din = 16'd13;
        start = 1'b1;
        #10 start = 1'b0;
        #10 wait (done == 1'b1);
        $display("-----------------------------------------");
        $display("Input: %d", din);
        // Add expected result for 13

        // End simulation
        $stop;
    end
endmodule

