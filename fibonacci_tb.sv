`timescale 1ns/1ns

module fibonacci_tb;

  logic clk; 
  logic reset;
  logic [15:0] din;
  logic start;
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
    reset = 1'b1;
    #10 reset = 1'b0;

    // Test cases
    perform_test(0);
    perform_test(5);
    perform_test(11);
    perform_test(23);

    // Finish simulation
    $stop;
  end

  // Test function
  task perform_test(input [15:0] test_value);
    begin
      din = test_value;
      start = 1'b1;
      #10 start = 1'b0;
      wait(done);
      $display("Fibonacci(%0d) = %0d", din, dout);
      if (dout == expected_fib(test_value)) 
        $display("Result is correct.");
      else 
        $display("Result is incorrect. Expected: %0d", expected_fib(test_value));
      #20; // Delay before next test
    end
  endtask

  // Function to return expected Fibonacci number
  function automatic [15:0] expected_fib(input [15:0] n);
    automatic [15:0] a = 0;
    automatic [15:0] b = 1;
    automatic [15:0] i;
    for (i = 0; i < n; i = i + 1) begin
      b = a + b;
      a = b - a;
    end
    return a;
  endfunction

endmodule
