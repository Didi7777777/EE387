module fibonacci(
    input logic clk, 
    input logic reset,
    input logic [15:0] din,
    input logic start,
    output logic [15:0] dout,
    output logic done
);

    enum logic [1:0] {IDLE, CALC, DONE} state, next_state;
    logic [15:0] num1, num2;
    logic [15:0] count;

    // State transition logic
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            dout <= 0;
            done <= 0;
            num1 <= 0;
            num2 <= 1;
            count <= 0;
        end else begin
            state <= next_state;
            if (state == CALC) begin
                dout <= num1;
                num1 <= num2;
                num2 <= num1 + num2;
                count <= count + 1;
            end else if (state == DONE) begin
                done <= 1'b1;
            end
        end
    end

    // Next state logic
    always_comb begin
        next_state = state; // Default to staying in the same state
        case (state)
            IDLE: begin
                if (start) begin
                    next_state = CALC;
                   
                end
            end
            CALC: begin
                if (count >= din) begin
                    next_state = DONE;
                end
            end
            DONE: begin
                // Stay in DONE state until reset
            end
            default: begin
                next_state = IDLE;
            end
        endcase
    end

endmodule
















module fibonacci(
    input logic clk, 
    input logic reset,
    input logic [15:0] din,
    input logic start,
    output logic [15:0] dout,
    output logic done
);

    enum logic [1:0] {IDLE, CALC, DONE} state, next_state;
    logic [15:0] num1, num2;
    logic [15:0] count;

    // State transition logic
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            dout <= 0;
            done <= 0;
            num1 <= 0;
            num2 <= 1;
            count <= 0;
        end else begin
            state <= next_state;
        end
    end

    always_ff @(posedge clk) begin
        if (state == CALC) begin
            if (count < din) begin
                num1 <= num2;
                num2 <= num1 + num2;
                count <= count + 1;
            end
            if (count == din) begin
                dout <= num1;
            end
        end
    end

    // Next state logic
    always_comb begin
        next_state = state; // Default to staying in the same state
        case (state)
            IDLE: if (start) next_state = CALC;
            CALC: if (count >= din) next_state = DONE;
            DONE: if (!start) next_state = IDLE;
            default: next_state = IDLE;
        endcase
    end
endmodule

