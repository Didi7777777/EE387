module fibonacci(
    input logic clk, 
    input logic reset,
    input logic [15:0] din,
    input logic start,
    output logic [15:0] dout,
    output logic done
);

    // Local logic signals
    enum logic [1:0] {IDLE, CALCULATING, DONE} state;
    logic [15:0] fib0, fib1, temp;
    logic [4:0] count;

    // State Machine and Logic
    always_ff @(posedge clk, posedge reset) begin
        if (reset) begin
            state <= IDLE;
            fib0 <= 0;
            fib1 <= 1;
            count <= 0;
            done <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        if (din == 0 || din == 1) begin
                            dout <= din;
                            done <= 1;
                            state <= DONE;
                        end else begin
                            dout <= 0;
                            count <= din - 2;  // Minus two because first two Fibonacci numbers are set
                            state <= CALCULATING;
                        end
                    end
                end
                CALCULATING: begin
                    temp <= fib0 + fib1;
                    fib0 <= fib1;
                    fib1 <= temp;
                    if (count == 0) begin
                        dout <= temp;
                        done <= 1;
                        state <= DONE;
                    end else begin
                        count <= count - 1;
                    end
                end
                DONE: begin
                    if (!start) begin
                        done <= 0;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule
