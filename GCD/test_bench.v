`timescale 1ns/1ps

module gcd_ip_tb;

    reg clk;
    reg rst;
    reg [7:0] a;
    reg [7:0] b;
    wire [7:0] cout;
    wire isdone;

    // ????????
    gcd_ip_top uut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .cout(cout),
        .isdone(isdone)
    );

    // ????????10ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    task test_gcd(input [7:0] x, input [7:0] y);
    begin
        rst = 1;
        a = 0; b = 0;
        #20;
        rst = 0;
        a = x;
        b = y;

        // ?? cout ? 0???????
        wait (cout != 0);
        $display("GCD(%d, %d) = %d at time %0t", x, y, cout, $time);

        // ??????????????
        #50;
    end
    endtask

    initial begin
        // ?????
        test_gcd(8'd48, 8'd18);

        // ?????
        test_gcd(8'd56, 8'd98);

        // ?????
        test_gcd(8'd60, 8'd45);

        // ?????
        test_gcd(8'd18, 8'd48);

        $stop;
    end

endmodule

