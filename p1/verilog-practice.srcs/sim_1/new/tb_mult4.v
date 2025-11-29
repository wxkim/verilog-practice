`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 05:40:18 PM
// Design Name: 
// Module Name: tb_mult4
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


module tb_mult4(

    );
    
    // Testbench variables
    reg [3:0] A; // 4-bit input A (register for test)
    reg [3:0] B; // 4-bit input B (register for test)
    wire [7:0] P; // 8-bit product output from multiplier
    // Instantiate the multiplier module
    multiplier_4b UUT (
    .A(A),
    .B(B),
    .P(P)
    );
    // Test procedure
    initial begin
    // Test cases
    A = 4'b0010; B = 4'b0011; #10; // Test case 1: A = 2, B = 3 -> P = 6
    
    A = 4'b0101; B = 4'b0101; #10; // Test case 2: A = 5, B = 5 -> P = 25
    
    A = 4'b1111; B = 4'b1111; #10; // Test case 3: A = 15, B = 15 -> P = 225
    
    A = 4'b1001; B = 4'b0011; #10; // Test case 4: A = 9, B = 3 -> P = 27
    
    A = 4'b0000; B = 4'b1010; #10; // Test case 5: A = 0, B = 10 -> P = 0

$finish; // End simulation
end
endmodule
