`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/27/2025 06:20:39 PM
// Design Name: 
// Module Name: 4bit_subtractor
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


module s4bit_subtractor(
    input [3:0] a,
    input [3:0] b,
    input [3:0] sum,
    output cout
    );
    
    wire [3:0] b_comp;
    wire       c_out;

    assign b_comp = ~b;  

    s4bit_adder _adder (
        .a     (a),
        .b     (b_comp),
        .c_in  (1'b1),   //  2's comp
        .sum   (sum),
        .c_out (c_out)
    );

    assign b_out = ~c_out;
endmodule
