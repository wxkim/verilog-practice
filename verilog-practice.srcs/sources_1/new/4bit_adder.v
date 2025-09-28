`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2025 06:20:39 PM
// Design Name: 
// Module Name: 4bit_adder
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


module s4bit_adder(
    input  [3:0] a,
    input  [3:0] b,
    input        c_in,
    output [3:0] sum,
    output       c_out
    );
    
    wire c1, c2, c3;  

    // bit 0
    assign sum[0] = a[0] ^ b[0] ^ c_in;
    assign c1     = (a[0] & b[0]) | (a[0] & c_in) | (b[0] & c_in);

    // bit 1
    assign sum[1] = a[1] ^ b[1] ^ c1;
    assign c2     = (a[1] & b[1]) | (a[1] & c1) | (b[1] & c1);

    // bit 2
    assign sum[2] = a[2] ^ b[2] ^ c2;
    assign c3     = (a[2] & b[2]) | (a[2] & c2) | (b[2] & c2);

    // bit 3
    assign sum[3] = a[3] ^ b[3] ^ c3;
    assign c_out  = (a[3] & b[3]) | (a[3] & c3) | (b[3] & c3);
    
endmodule
