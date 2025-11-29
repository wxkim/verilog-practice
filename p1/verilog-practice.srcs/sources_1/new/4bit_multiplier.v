`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 04:16:52 PM
// Design Name: 
// Module Name: 4bit_multiplier
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


module multiplier_4b(
    input [3:0] A,
    input [3:0] B,
    output [7:0] P
    );
    
    wire [7:0] p0, p1, p2, p3, sum1, sum2;
    wire c1, c2, c3;
    
    assign p0 = {4'b0000, A[0] ? B : 4'b0000};
    assign p1 = {4'b000, A[1] ? B : 4'b0000, 1'b0};
    assign p2 = {4'b00, A[2] ? B : 4'b0000, 2'b00};
    assign p3 = {4'b0, A[3] ? B : 4'b0000, 3'b000};
    
    adder_8b a1 (.A(p0), .B(p1), .Sum(sum1), .Cin(1'b0), .Cout(c1)); 
    
    adder_8b a2 (.A(p2), .B(sum1), .Sum(sum2), .Cin(c1), .Cout(c2)); 
    
    adder_8b a3 (.A(p3), .B(sum2), .Sum(P), .Cin(c2), .Cout(c3));
    
endmodule
