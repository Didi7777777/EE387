`timescale 1ns/1ns

module fibonacci_tb;

  logic clk; 
  logic reset;
  logic [15:0] din;
  logic start;
  logic [15:0] dout;
  logic done;

  fibonacci fib(clk, reset, din, start, dout, done);

  // Clock generator
  always begin
    clk = 1'b0;
    #5 clk = 1'b1;
    #5;
  end

  initial begin
    // Reset
    reset = 1'b1;
    #10 reset = 1'b0;

    // Test Case 1: Input 5
    #20;
    din = 5;
    start = 1'b1;
    #10 start = 1'b0;
    wait (done);
    #10; 
    $display("-----------------------------------------");
    $display("Input: %d, Result: %d", din, dout);
    
    // Test Case 2: Input 8
    #20;
    din = 8;
    start = 1'b1;
    #10 start = 1'b0;
    wait (done);
    #10;
    $display("-----------------------------------------");
    $display("Input: %d, Result: %d", din, dout);

    // Test Case 3: Input 9
    #20;
    din = 9;
    start = 1'b1;
    #10 start = 1'b0;
    wait (done);
    #10;
    $display("-----------------------------------------");
    $display("Input: %d, Result: %d", din, dout);

    // Test Case 4: Input 13
    #20;
    din = 13;
    start = 1'b1;
    #10 start = 1'b0;
    wait (done);
    #10;
    $display("-----------------------------------------");
    $display("Input: %d, Result: %d", din, dout);

    // End of test
    $stop;
  end
endmodule

