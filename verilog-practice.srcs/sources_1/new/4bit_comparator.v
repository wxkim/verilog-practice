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
    input [3:0] a,
    input [3:0] b,
    output le, // a < b
    output eq, // a = b
    output ge // a > b
    );
    
    wire c_out;

    assign b_comp = ~b;  

    s4bit_subtractor _subtractor (
        .a     (a),
        .b     (b),  
        .sum   (sum),
        .borrow(borrow)
    );
    
    assign borrow = ~c_out;
    
    assign eq = (sum == 4'b0000);

    assign le = borrow | eq;

    assign ge = ~borrow;
    
    
endmodule
