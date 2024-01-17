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
    // Reset
    #0 reset = 0;
    #10 reset = 1;
    #10 reset = 0;
    
    // Test for input 5
    perform_test(5, 5);

    // Test for input 8
    perform_test(8, 21);

    // Test for input 9
    perform_test(9, 34);

    // Test for input 13
    perform_test(13, 233);

    // Done
    $stop;
  end

  // Function to perform individual test
  task perform_test(input [15:0] test_value, input [15:0] expected_output);
  begin
    din = test_value;
    start = 1'b1;
    #10 start = 1'b0;
    wait (done == 1'b1);
    #10; // Additional delay after done is asserted

    // Display Result
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === expected_output)
        $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
        $display("INCORRECT RESULT: %d, SHOULD BE: %d", dout, expected_output);
  end
  endtask

endmodule

