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
        #5;
        clk = 1'b1;
        #5;
    end

    initial begin
        // Reset
        reset = 1;
        #20 reset = 0;

        // Test with various inputs
        fork
            // Test Case 1: Fibonacci(5)
            begin
                #30;
                din = 5;
                start = 1'b1;
                #10 start = 1'b0;
                wait (done == 1'b1);
                $display("Input: %d, Result: %d", din, dout);
            end
            // Additional Test Cases
            // Add more test cases here
        join

        // Done
        #100 $stop;
    end
endmodule
