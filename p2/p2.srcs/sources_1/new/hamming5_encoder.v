`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 04:04:13 PM
// Design Name: 
// Module Name: hamming5_encoder
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


module hamming95_encoder(
    input [4:0] data_in,
    output [8:0] encoded_out
    );
    
    
    wire p1, p2, p4, p8;
    
    wire d1, d2, d3, d4, d5;

    assign d1 = data_in[0];
    assign d2 = data_in[1];
    assign d3 = data_in[2];
    assign d4 = data_in[3];
    assign d5 = data_in[4];

    
    assign p1 = d1 ^ d2 ^ d4 ^ d5; 
    assign p2 = d1 ^ d3 ^ d4;
    assign p4 = d2 ^ d3 ^ d4;
    assign p8 = d5;
    
    assign encoded_out = {
        d5,
        p8,
        d4,
        d3,
        d2,
        p4,
        d1,
        p2,
        p1
    };
    
endmodule