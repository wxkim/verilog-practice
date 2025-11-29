`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 05:51:08 PM
// Design Name: 
// Module Name: multiplier_8b
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


module multiplier_8b(
    input [7:0] A,
    input [7:0] B,
    output [15:0] P
    );
    
    wire [15:0] p0, p1, p2, p3, p4, p5, p6, p7;
    wire [15:0] s1, s2, s3, s4, s5, s6;
    wire c1, c2, c3, c4, c5, c6;
    
    assign p0 = {8'b00000000, A[0] ? B : 8'b00000000}; // Multiply A[0] by B(shift 0 bits)
    assign p1 = {7'b0000000, A[1] ? B : 8'b00000000, 1'b0}; // Multiply A[1] by B (shift 1 bit)
    assign p2 = {6'b000000, A[2] ? B : 8'b00000000, 2'b00}; // Multiply A[2] by B (shift 2 bits)
    assign p3 = {5'b00000, A[3] ? B : 8'b00000000, 3'b000}; // Multiply A[3] by B (shift 3 bits)
    assign p4 = {4'b0000, A[4] ? B : 8'b00000000, 4'b0000}; // Multiply A[0] by B(shift 0 bits)
    assign p5 = {3'b000, A[5] ? B : 8'b00000000, 5'b00000}; // Multiply A[1] by B (shift 1 bit)
    assign p6 = {2'b00, A[6] ? B : 8'b00000000, 6'b000000}; // Multiply A[2] by B (shift 2 bits)
    assign p7 = {1'b0, A[7] ? B : 8'b00000000, 7'b0000000};
    
    adder_16b a1 (.A(p0), .B(p1), .Sum(s1), .Cin(1'b0), .Cout(c1));
    adder_16b a2 (.A(s1), .B(p2), .Sum(s2), .Cin(c1), .Cout(c2)); 
    adder_16b a3 (.A(s2), .B(p3), .Sum(s3), .Cin(c2), .Cout(c3)); 
    adder_16b a4 (.A(s3), .B(p4), .Sum(s4), .Cin(c3), .Cout(c4)); 
    adder_16b a5 (.A(s4), .B(p5), .Sum(s5), .Cin(c4), .Cout(c5)); 
    adder_16b a6 (.A(s5), .B(p6), .Sum(s6), .Cin(c5), .Cout(c6)); 
    adder_16b a7 (.A(s6), .B(p7), .Sum(P), .Cin(c6), .Cout()); 
    
endmodule
