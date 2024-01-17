module fibonacci(
    input logic clk, 
    input logic reset,
    input logic [15:0] din,
    input logic start,
    output logic [15:0] dout,
    output logic done
);

    enum logic [1:0] {IDLE, CALCULATE, DONE} state, next_state;
    logic [15:0] a, b, next_a, next_b;
    logic [15:0] count, next_count;

    // State transition
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            a <= 0;
            b <= 1;
            count <= 0;
        end else begin
            state <= next_state;
            a <= next_a;
            b <= next_b;
            count <= next_count;
        end
    end

    // Next state logic
    always_comb begin
        next_state = state;
        next_a = a;
        next_b = b;
        next_count = count;
        done = 1'b0;
        dout = 0;

        case (state)
            IDLE: begin
                if (start) begin
                    next_state = CALCULATE;
                    next_count = din;
                end
            end
            CALCULATE: begin
                if (count > 0) begin
                    next_a = b;
                    next_b = a + b;
                    next_count = count - 1;
                end else begin
                    next_state = DONE;
                    dout = a;
                end
            end
            DONE: begin
                done = 1'b1;
                next_state = IDLE;
            end
        endcase
    end

endmodule

