`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/15/2025 11:41:17 PM
// Design Name: 
// Module Name: tb_xor_gate
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


module tb_xor_gate(

    );
    
    reg a;
    reg b;
    wire z;
    
    xor_gate UUT (.a(a), .b(b), .z(z));
    
    initial
    
    begin
        a = 0;
        b = 0;
        #10;
        
        a = 1;
        b = 0;
        #10;
        
        a = 0;
        b = 1;
        #10;
        
        a = 1;
        b = 1;
        #10;
        $finish;
    end
endmodule










