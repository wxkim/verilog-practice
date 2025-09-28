`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2025 07:44:52 PM
// Design Name: 
// Module Name: tb_4b_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_4b_adder(

    );
    
    reg  [3:0] a;
    reg  [3:0] b;
    reg        c_in;

    wire [3:0] sum;
    wire       c_out;
    
    s4bit_adder UUT (
        .a(a),
        .b(b),
        .c_in(c_in),
        .sum(sum),
        .c_out(c_out)
    );
    
    initial begin
        $monitor("Time=%0t | a=%b (%0d) b=%b (%0d) c_in=%b => sum=%b (%0d) c_out=%b",
                 $time, a, a, b, b, c_in, sum, sum, c_out);

        a = 4'b0101; 
        b = 4'b0011; 
        c_in = 0; 
        #10;

        // Test case 2: 15 + 1 = 16 (overflow, expect sum=0000, c_out=1)
        a = 4'b1111; b = 4'b0001; c_in = 0; #10;

        // Test case 3: 7 + 8 = 15
        a = 4'b0111; b = 4'b1000; c_in = 0; #10;

        // Test case 4: 9 + 6 + carry_in(1) = 16
        a = 4'b1001; b = 4'b0110; c_in = 1; #10;

        // Test case 5: 0 + 0 + carry_in(1) = 1
        a = 4'b0000; b = 4'b0000; c_in = 1; #10;

        // Test case 6: Random big add 12 + 11 = 23 (expect sum=0111, c_out=1)
        a = 4'b1100; b = 4'b1011; c_in = 0; #10;

        $finish;
    end

endmodule
