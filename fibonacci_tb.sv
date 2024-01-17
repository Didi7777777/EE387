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
    
    // Input of 5
    #10;
    din = 16'd5;
    start = 1'b1;
    #10 start = 1'b0;
    
    // Wait until calculation is done
    wait (done == 1'b1);
    #10; // Additional delay after done is asserted

    // Display Result
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === 5)
        $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
        $display("INCORRECT RESULT: %d, SHOULD BE: 5", dout);

    // Done
    $stop;
  end
endmodule

