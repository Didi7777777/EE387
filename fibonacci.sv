module fibonacci(
    input logic clk, 
    input logic reset,
    input logic [15:0] din,
    input logic start,
    output logic [15:0] dout,
    output logic done
);

    enum logic [1:0] {IDLE, CALCULATING, DONE} state;
    logic [15:0] fib0, fib1, next_fib;
    logic [15:0] counter;

    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            fib0 <= 0;
            fib1 <= 1;
            dout <= 0;
            done <= 0;
            counter <= 0;
        end else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        state <= CALCULATING;
                        counter <= din;
                        done <= 0;
                        if (din <= 1) begin
                            dout <= din; // For 0 or 1, output the number itself
                            state <= DONE;
                        end
                    end
                end
                CALCULATING: begin
                    if (counter > 1) begin
                        next_fib = fib0 + fib1;
                        fib0 <= fib1;
                        fib1 <= next_fib;
                        counter <= counter - 1;
                    end else begin
                        dout <= fib1;
                        state <= DONE;
                    end
                end
                DONE: begin
                    done <= 1;
                    if (!start) begin
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule
