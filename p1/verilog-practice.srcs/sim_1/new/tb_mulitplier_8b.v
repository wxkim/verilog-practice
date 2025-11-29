`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 06:19:15 PM
// Design Name: 
// Module Name: tb_mulitplier_8b
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


module tb_mulitplier_8b(

    );
    
    reg [7:0] A;
    reg [7:0] B;
    wire [15:0] P;
    
    multiplier_8b UUT (
        .A(A),
        .B(B),
        .P(P)
    );
    
    initial begin
        A = 8'd100; B = 8'd10; #10; // = 1000
        A = 8'd50; B = 8'd50; #10; // = 2500
        A = 8'd255; B = 8'd255; #10; // = 65536
        A = 8'd150; B = 8'd10; #10; // = 1500
        A = 8'd90; B = 8'd11; #10; // = 990
        $finish;
        
    end
    
endmodule
