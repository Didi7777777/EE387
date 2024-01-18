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
    #0 reset = 1;
    #20 reset = 0;

    /* ------------- Input of 5 ------------- */
    // Inputs into module/ Assert start
    #10;
    din = 16'd5;
    start = 1'b1;
    #10 start = 1'b0;
    
    // Wait until calculation is done  
    wait (done == 1'b1);

    // Display Result
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === 5)
        $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
        $display("INCORRECT RESULT: %d, SHOULD BE: 5", dout);

    // Reset before next input
    reset = 1;
    #20 reset = 0;

    /* ------------- Input of 8 ------------- */
    // Inputs into module/ Assert start
    #10;
    din = 16'd8;
    start = 1'b1;
    #10 start = 1'b0;
    
    // Wait until calculation is done  
    wait (done == 1'b1);

    // Display Result
    $display("-----------------------------------------");
    $display("Input: %d", din);
    if (dout === 21)
        $display("CORRECT RESULT: %d, GOOD JOB!", dout);
    else
        $display("INCORRECT RESULT: %d, SHOULD BE: 21", dout);

    // Reset before next input
    reset = 1;
    #20 reset = 0;

    /* ------------- Input of 9 ------------- */
    // Inputs into module/ Assert start
    #10;
    din = 16'd9;
    start = 1'b1;
    #10 start = 1'b0;
    
    // Wait until calculation is done  
    wait (done == 1'b1);

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
