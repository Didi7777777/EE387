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
    #0 reset = 0;
    #10 reset = 1;
    #10 reset = 0;
    
    // Test Case: Input 5
    #10;
    din = 16'd5;
    start = 1'b1;
    #10 start = 1'b0;
    wait (done == 1'b1);
    #10; // Additional delay after done is asserted
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === 5)
        $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
        $display("INCORRECT RESULT: %d, SHOULD BE: 5", dout);

    // Test Case: Input 8
    #20;
    din = 16'd8;
    start = 1'b1;
    #10 start = 1'b0;
    wait (done == 1'b1);
    #10;
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === 21)
        $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
        $display("INCORRECT RESULT: %d, SHOULD BE: 21", dout);

    // Test Case: Input 9
    #20;
    din = 16'd9;
    start = 1'b1;
    #10 start = 1'b0;
    wait (done == 1'b1);
    #10;
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === 34)
        $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
        $display("INCORRECT RESULT: %d, SHOULD BE: 34", dout);

    // Test Case: Input 13
    #20;
    din = 16'd13;
    start = 1'b1;
    #10 start = 1'b0;
    wait (done == 1'b1);
    #10;
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === 233)
        $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
        $display("INCORRECT RESULT: %d, SHOULD BE: 233", dout);

    // Done
    $stop;
  end
endmodule

