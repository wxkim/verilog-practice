`timescale 1ns / 1ps

module tb_4b_comparator;

    reg  [3:0] a;
    reg  [3:0] b;
    wire lt, eq, gt;

    s4bit_comparator UUT (
        .a(a),
        .b(b),
        .lt(lt),
        .eq(eq),
        .gt(gt)
    );

    initial begin
        $monitor("Time=%0t | a=%0d b=%0d => lt=%b eq=%b gt=%b",
                 $time, a, b, lt, eq, gt);

        a = 4'd3;  b = 4'd7;  #10;
        a = 4'd9;  b = 4'd4;  #10;
        a = 4'd5;  b = 4'd5;  #10;
        a = 4'd0;  b = 4'd0;  #10;
        a = 4'd15; b = 4'd0;  #10;
        a = 4'd0;  b = 4'd15; #10;

        $finish;
    end

endmodule
