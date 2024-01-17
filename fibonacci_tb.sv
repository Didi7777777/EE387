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
    reset = 1'b1;
    #10 reset = 1'b0;

    // Test with input of 5
    #20; // Wait for a stable state
    din = 16'd5;
    start = 1'b1;
    #10 start = 1'b0; // Trigger the start of calculation

    // Wait for the calculation to complete
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
