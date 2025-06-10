module comparator (
    input rst,clk,
    input [7:0] a,
    input [7:0] b,
    output reg [1:0] cout
);
    always @(*) begin
        if (a > b)
            cout = 2'b00;
        else if (a < b)
            cout = 2'b01;
        else
            cout = 2'b10;
    end
endmodule
