module gcd_fsm(
    input clk,
    input rst,
    input [1:0] cpr,     // comparator output: 00 (a > b), 01 (a < b), 10 (a == b)
    output reg load,
    output reg compute,
    output reg done
);

    // ????
    parameter IDLE = 2'b00;
    parameter LOAD = 2'b01;
    parameter CALC = 2'b10;
    parameter DONE = 2'b11;

    reg [1:0] state, next_state;

    // ??????
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    // ????????
    always @(*) begin
        case (state)
            IDLE:  next_state = LOAD;
            LOAD:  next_state = CALC;
            CALC:  next_state = (cpr == 2'b10) ? DONE : CALC;
            DONE:  next_state = DONE;
            default: next_state = IDLE;
        endcase
    end

    // ??????
    always @(*) begin
        load    = 1'b0;
        compute = 1'b0;
        done    = 1'b0;

        case (state)
            LOAD:  load    = 1'b1;
            CALC:  compute = 1'b1;
            DONE:  done    = 1'b1;
        endcase
    end

endmodule

