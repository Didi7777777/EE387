`timescale 1ns/1ns

module fibonacci_tb;

  logic clk; 
  logic reset = 1'b0;
  logic [15:0] din = 16'h0;
  logic start = 1'b0;
  logic [15:0] dout;
  logic done;

  // Instantiate the Fibonacci module
  fibonacci fib(clk, reset, din, start, dout, done);

  // Clock Generator
  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  initial begin
    // Reset sequence
    reset = 1'b1;
    #10 reset = 1'b0;

    // Testing with input of 5
    #20; // Wait for a stable state
    din = 16'd5; // Set input to 5
    start = 1'b1; // Start the calculation
    #10 start = 1'b0; // Stop the start signal

    // Wait for calculation to complete
    wait (done == 1'b1);

    // Display results
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === 5)
        $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
        $display("INCORRECT RESULT: %d, SHOULD BE: 5", dout);

    // End of test
    $stop;
  end
endmodule
