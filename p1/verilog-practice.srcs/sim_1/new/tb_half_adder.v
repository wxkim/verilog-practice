`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/24/2025 05:38:12 PM
// Design Name: 
// Module Name: tb_half_adder
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


module tb_half_adder(

    );
    
    reg a;
    reg b;
    wire carry_out;
    wire sum;
    
    half_adder UUT (.a(a), .b(b), .sum(sum), .carry_out(carry_out));
    
    initial
    begin

    // Test case 1: A=0, B=0
    a = 0; b = 0;
    #10; // Wait for 10 time units
    // Test case 2: A=0, B=1
    a = 0; b = 1;
    #10;
    // Test case 3: A=1, B=0
    a = 1; b = 0;
    #10;
    // Test case 4: A=1, B=1
    a = 1; b = 1;
    #10;
    // End simulation
    $finish;
    end
    
endmodule





