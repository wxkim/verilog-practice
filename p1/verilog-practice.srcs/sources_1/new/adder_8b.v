`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 05:26:22 PM
// Design Name: 
// Module Name: adder_8b
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


module adder_8b(
    input [7:0] A,
    input [7:0] B,
    output [7:0] Sum,
    input Cin,
    output Cout
    );
    
    wire [7:0] carry;
    
    full_adder_1B fa0 (.a(A[0]), .b(B[0]), .cin(1'b0), .sum(Sum[0]), .cout(carry[0])); // LSB
    full_adder_1B fa1 (.a(A[1]), .b(B[1]), .cin(carry[0]), .sum(Sum[1]), .cout(carry[1]));
    full_adder_1B fa2 (.a(A[2]), .b(B[2]), .cin(carry[1]), .sum(Sum[2]), .cout(carry[2]));
    full_adder_1B fa3 (.a(A[3]), .b(B[3]), .cin(carry[2]), .sum(Sum[3]), .cout(carry[3]));
    full_adder_1B fa4 (.a(A[4]), .b(B[4]), .cin(carry[3]), .sum(Sum[4]), .cout(carry[4]));
    full_adder_1B fa5 (.a(A[5]), .b(B[5]), .cin(carry[4]), .sum(Sum[5]), .cout(carry[5]));
    full_adder_1B fa6 (.a(A[6]), .b(B[6]), .cin(carry[5]), .sum(Sum[6]), .cout(carry[6]));
    full_adder_1B fa7 (.a(A[7]), .b(B[7]), .cin(carry[6]), .sum(Sum[7]), .cout(CarryOut));

    
    
endmodule
