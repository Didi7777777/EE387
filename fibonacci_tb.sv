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
    // Initialize
    reset = 1'b1;
    start = 1'b0;
    din = 16'h0;
    #10 reset = 1'b0;

    // Set input to 5 and start the module
    #10;
    din = 5;
    start = 1'b1;
    #10 start = 1'b0;

    // Wait for calculation to complete
    wait(done);

    // Display the result
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === 5) // Checking if the output is correct
        $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
        $display("INCORRECT RESULT: %d, SHOULD BE: 5", dout);

    // End simulation
    #100 $stop;
  end
endmodule
