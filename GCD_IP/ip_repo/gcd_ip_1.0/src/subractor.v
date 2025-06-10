module subtractor (
    input clk,
    input rst,
    input [1:0] cmd,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] aout,
    output reg [7:0] bout
);

always @(posedge clk) begin
    if (rst) begin
        aout <= 8'd0;
        bout <= 8'd0;
    end else begin
        case (cmd)
            2'b00: begin // a > b
                aout <= a - b;
                bout <= b;
            end
            2'b01: begin // a < b
                aout <= a;
                bout <= b - a;
            end
            2'b10: begin // a == b
                aout <= a;
                bout <= b;
            end
            default: begin
                aout <= a;
                bout <= b;
            end
        endcase
    end
end

endmodule
