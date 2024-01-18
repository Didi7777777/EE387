`timescale 1ns/1ns

module fibonacci_tb;

  logic clk; 
  logic reset = 1'b0;
  logic [15:0] din = 16'h0;
  logic start = 1'b0;
  logic [15:0] dout;
  logic done;

  // instantiate your design
  fibonacci fib(clk, reset, din, start, dout, done);

  // Clock Generator
  always begin
    clk = 1'b0;
    #5;
    clk = 1'b1;
    #5;
  end

  initial begin
    // Common reset sequence for each test
    task common_reset;
      begin
        reset = 1'b1; // Assert reset
        #20;          // Wait for reset to take effect
        reset = 1'b0; // Deassert reset
        #20;          // Wait for deassertion to stabilize
      end
    endtask

    // Test sequence for a given input
    task perform_test(input [15:0] test_input);
      begin
        din = test_input;      // Set test input
        start = 1'b1;          // Start calculation
        #10;                   // Wait for start signal to be acknowledged
        start = 1'b0;          // Stop start signal
        wait(done == 1'b1);    // Wait for calculation to complete
        #10;                   // Additional wait time, if necessary
      end
    endtask

    // Reset
    common_reset();

    /* ------------- Input of 5 ------------- */
    perform_test(16'd5);

    // Display Result
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === 5)
      $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
      $display("INCORRECT RESULT: %d, SHOULD BE: 5", dout);

    common_reset();

    /* ------------- Input of 8 ------------- */
    perform_test(16'd8);

    // Display Result
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === 21)
      $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
      $display("INCORRECT RESULT: %d, SHOULD BE: 21", dout);

    common_reset();

    /* ------------- Input of 9 ------------- */
    perform_test(16'd9);

    // Display Result
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === 34)
      $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
      $display("INCORRECT RESULT: %d, SHOULD BE: 34", dout);

    // Done
    $stop;
  end
endmodule
