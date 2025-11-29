`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 04:04:13 PM
// Design Name: 
// Module Name: hamming5_decoder
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


module hamming95_decoder (
    input  wire [8:0] encoded_in, 
    output wire [4:0] data_out,    
    output wire error_detected 
);

    wire p1, p2, p4, p8;
    wire d1, d2, d3, d4, d5;
    
    assign p1 = encoded_in[0];
    assign p2 = encoded_in[1];
    assign d1 = encoded_in[2];
    assign p4 = encoded_in[3];
    assign d2 = encoded_in[4];
    assign d3 = encoded_in[5];
    assign d4 = encoded_in[6];
    assign p8 = encoded_in[7];
    assign d5 = encoded_in[8];


    wire s1 = p1 ^ d1 ^ d2 ^ d4 ^ d5;
    wire s2 = p2 ^ d1 ^ d3 ^ d4;
    wire s4 = p4 ^ d2 ^ d3 ^ d4;
    wire s8 = p8 ^ d5;

    wire [3:0] syndrome = {s8, s4, s2, s1};

    assign error_detected = |syndrome;

    reg [8:0] corrected;

    always @(*) begin
        corrected = encoded_in;
    
        if (syndrome != 4'b0000) begin
            case (syndrome)
                4'd1: corrected[0] = ~corrected[0]; // bit 1 (P1)
                4'd2: corrected[1] = ~corrected[1]; // bit 2 (P2)
                4'd3: corrected[2] = ~corrected[2]; // bit 3 (D1)
                4'd4: corrected[3] = ~corrected[3]; // bit 4 (P4)
                4'd5: corrected[4] = ~corrected[4]; // bit 5 (D2)
                4'd6: corrected[5] = ~corrected[5]; // bit 6 (D3)
                4'd7: corrected[6] = ~corrected[6]; // bit 7 (D4)
                4'd8: corrected[7] = ~corrected[7]; // bit 8 (P8)
                4'd9: corrected[8] = ~corrected[8]; // bit 9 (D5)
                default: corrected = encoded_in;     // ignore invalid
            endcase
        end
    end


    assign data_out = {
        corrected[8], // D5
        corrected[6], // D4
        corrected[5], // D3
        corrected[4], // D2
        corrected[2]  // D1
    };

endmodule

