`timescale 1ns / 1ps

module tb_4b_subtractor;

    // DUT inputs
    reg  [3:0] a;
    reg  [3:0] b;

    // DUT outputs
    wire [3:0] sum;
    wire       borrow;

    // Instantiate the DUT
    s4bit_subtractor UUT (
        .a(a),
        .b(b),
        .sum(sum),
        .borrow(borrow)
    );

    initial begin
        $monitor("Time=%0t | a=%0d b=%0d => sum=%0d (%b) borrow=%b",
                  $time, a, b, sum, sum, borrow);

        // Test case 1: 10 - 3 = 7
        a = 4'd10; b = 4'd3; #10;

        // Test case 2: 3 - 10 = -7 (wraps to 9, borrow=1)
        a = 4'd3; b = 4'd10; #10;

        // Test case 3: 5 - 5 = 0
        a = 4'd5; b = 4'd5; #10;

        // Test case 4: 0 - 1 = -1 (wraps to 15, borrow=1)
        a = 4'd0; b = 4'd1; #10;

        // Test case 5: 15 - 15 = 0
        a = 4'd15; b = 4'd15; #10;

        // Test case 6: 12 - 7 = 5
        a = 4'd12; b = 4'd7; #10;

        $finish;
    end

endmodule
