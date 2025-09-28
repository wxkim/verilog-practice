`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2025 06:20:39 PM
// Design Name: 
// Module Name: 4bit_comparator
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


module s4bit_comparator(
    input  [3:0] a,
    input  [3:0] b,
    output       lt, // a < b
    output       eq, // a == b
    output       gt  // a > b
);

    wire [3:0] sum;
    wire       borrow;

    s4bit_subtractor _subtractor (
        .a(a),
        .b(b),
        .sum(sum),
        .borrow(borrow)
    );

    assign eq = (sum == 4'b0000);       // equal
    assign lt = borrow;                 // less than
    assign gt = ~borrow & ~eq;          // greater than

endmodule

