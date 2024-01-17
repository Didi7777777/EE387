`timescale 1ns/1ns

module fibonacci_tb;

  logic clk; 
  logic reset;
  logic [15:0] din;
  logic start;
  logic [15:0] dout;
  logic done;

  // Instantiate your design
  fibonacci fib(clk, reset, din, start, dout, done);

  // Clock Generator
  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  initial begin
    // Reset
    reset = 1'b1;
    #10 reset = 1'b0;
    
    // Test Case 1: Input of 5
    #20;
    din = 16'd5;
    start = 1'b1;
    #10 start = 1'b0;
    #10 wait (done == 1'b1);
    $display("Input: %d, Fibonacci Number: %d", din, dout);

    // Test Case 2: Input of 8
    #30;
    din = 16'd8;
    start = 1'b1;
    #10 start = 1'b0;
    #10 wait (done == 1'b1);
    $display("Input: %d, Fibonacci Number: %d", din, dout);

    // Test Case 3: Input of 9
    #30;
    din = 16'd9;
    start = 1'b1;
    #10 start = 1'b0;
    #10 wait (done == 1'b1);
    $display("Input: %d, Fibonacci Number: %d", din, dout);

    // Test Case 4: Input of 13
    #30;
    din = 16'd13;
    start = 1'b1;
    #10 start = 1'b0;
    #10 wait (done == 1'b1);
    $display("Input: %d, Fibonacci Number: %d", din, dout);

    // End of test
    #10;
    $stop;
  end
endmodule
