`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2025 06:19:02 PM
// Design Name: 
// Module Name: full_adder_1B
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


module full_adder_1B(
    input a,
    input b,
    input cin,
    output cout,
    output sum
    );
    
    wire half_sum, overflow_add, overflow_carry;
    
    assign half_sum = a ^ b;
    assign overflow_add = a & b;
    assign overflow_carry = cin & half_sum;
    assign sum = cin ^ half_sum;
    assign cout = overflow_add | overflow_carry;
    
    
endmodule
