`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 05:52:42 PM
// Design Name: 
// Module Name: adder_16b
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


module adder_16b(
    input [15:0] A,
    input [15:0] B,
    output [15:0] Sum,
    input Cin,
    output Cout
    );
    
    wire [15:0] carry;
    
    full_adder_1B fa0 (.a(A[0]), .b(B[0]), .cin(1'b0), .sum(Sum[0]), .cout(carry[0])); // LSB
    full_adder_1B fa1 (.a(A[1]), .b(B[1]), .cin(carry[0]), .sum(Sum[1]), .cout(carry[1]));
    full_adder_1B fa2 (.a(A[2]), .b(B[2]), .cin(carry[1]), .sum(Sum[2]), .cout(carry[2]));
    full_adder_1B fa3 (.a(A[3]), .b(B[3]), .cin(carry[2]), .sum(Sum[3]), .cout(carry[3]));
    full_adder_1B fa4 (.a(A[4]), .b(B[4]), .cin(carry[3]), .sum(Sum[4]), .cout(carry[4]));
    full_adder_1B fa5 (.a(A[5]), .b(B[5]), .cin(carry[4]), .sum(Sum[5]), .cout(carry[5]));
    full_adder_1B fa6 (.a(A[6]), .b(B[6]), .cin(carry[5]), .sum(Sum[6]), .cout(carry[6]));
    full_adder_1B fa7 (.a(A[7]), .b(B[7]), .cin(carry[6]), .sum(Sum[7]), .cout(carry[7]));
    full_adder_1B fa8 (.a(A[8]), .b(B[8]), .cin(carry[7]), .sum(Sum[8]), .cout(carry[8])); 
    full_adder_1B fa9 (.a(A[9]), .b(B[9]), .cin(carry[8]), .sum(Sum[9]), .cout(carry[9]));
    full_adder_1B fa10 (.a(A[10]), .b(B[10]), .cin(carry[9]), .sum(Sum[10]), .cout(carry[10]));
    full_adder_1B fa11 (.a(A[11]), .b(B[11]), .cin(carry[10]), .sum(Sum[11]), .cout(carry[11]));
    full_adder_1B fa12 (.a(A[12]), .b(B[12]), .cin(carry[11]), .sum(Sum[12]), .cout(carry[12]));
    full_adder_1B fa13 (.a(A[13]), .b(B[13]), .cin(carry[12]), .sum(Sum[13]), .cout(carry[13]));
    full_adder_1B fa14 (.a(A[14]), .b(B[14]), .cin(carry[13]), .sum(Sum[14]), .cout(carry[14]));
    full_adder_1B fa15 (.a(A[15]), .b(B[15]), .cin(carry[14]), .sum(Sum[15]), .cout(Cout)); // MSB

  
    
    
endmodule
