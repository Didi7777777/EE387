`timescale 1ns/1ns

module fibonacci_tb;

    logic clk; 
    logic reset;
    logic [15:0] din;
    logic start;
    logic [15:0] dout;
    logic done;

    fibonacci fib_instance(clk, reset, din, start, dout, done);

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk; // 10ns clock period

    // Test sequence
    initial begin
        // Initialize
        reset = 1'b1;
        start = 1'b0;
        din = 0;
        #10 reset = 1'b0; // Release reset

        // Test cases
        // Fibonacci(0)
        #20;
        din = 0;
        start = 1'b1;
        #10 start = 1'b0;
        wait(done);
        $display("Fibonacci(%0d) = %0d", din, dout);

        // Fibonacci(1)
        #20;
        din = 1;
        start = 1'b1;
        #10 start = 1'b0;
        wait(done);
        $display("Fibonacci(%0d) = %0d", din, dout);

        // Fibonacci(6)
        #20;
        din = 6;
        start = 1'b1;
        #10 start = 1'b0;
        wait(done);
        $display("Fibonacci(%0d) = %0d", din, dout);

        // Fibonacci(10)
        #20;
        din = 10;
        start = 1'b1;
        #10 start = 1'b0;
        wait(done);
        $display("Fibonacci(%0d) = %0d", din, dout);

        // Additional test cases can be added here following the same pattern

        // Finish simulation
        #100;
        $stop;
    end
endmodule
