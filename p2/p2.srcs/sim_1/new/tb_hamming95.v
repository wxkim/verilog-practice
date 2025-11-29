`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2025 10:12:16 PM
// Design Name: 
// Module Name: tb_hamming95
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


module tb_hamming95;

    reg  [4:0] data_in;
    reg  [8:0] encoded_in;
    wire [8:0] encoded_out;
    wire [4:0] decoded_data;
    wire       error_detected;

    hamming95_encoder encoder (
        .data_in(data_in),
        .encoded_out(encoded_out)
    );

    hamming95_decoder decoder (
        .encoded_in(encoded_in),
        .data_out(decoded_data),
        .error_detected(error_detected)
    );

    initial begin
        $display("=== Hamming (9,5) Testbench Start ===");

        $display("\nTest 1: No errors");
        data_in = 5'b10110;
        #10;
        encoded_in = encoded_out;
        #10;
        $display("Data: %b Enc: %b Dec: %b Err: %b",
                 data_in, encoded_out, decoded_data, error_detected);

        $display("\nTest 2: Error in parity bit");
        data_in = 5'b01101;
        #10;
        encoded_in = encoded_out;
        encoded_in[1] = ~encoded_in[1];
        #10;
        $display("Data: %b Enc: %b ErrEnc: %b Dec: %b Err: %b",
                 data_in, encoded_out, encoded_in, decoded_data, error_detected);

        $display("\nTest 3: Error in data bit (D3)");
        data_in = 5'b11011;
        #10;
        encoded_in = encoded_out;
        encoded_in[5] = ~encoded_in[5];
        #10;
        $display("Data: %b Enc: %b ErrEnc: %b Dec: %b Err: %b",
                 data_in, encoded_out, encoded_in, decoded_data, error_detected);

        $display("\nTest 4: Error in data bit (D5)");
        data_in = 5'b10001;
        #10;
        encoded_in = encoded_out;
        encoded_in[8] = ~encoded_in[8];
        #10;
        $display("Data: %b Enc: %b ErrEnc: %b Dec: %b Err: %b",
                 data_in, encoded_out, encoded_in, decoded_data, error_detected);

        $display("\nTest 5: Random bit error");
        data_in = 5'b01011;
        #10;
        encoded_in = encoded_out;
        encoded_in[3] = ~encoded_in[3];
        #10;
        $display("Data: %b Enc: %b ErrEnc: %b Dec: %b Err: %b",
                 data_in, encoded_out, encoded_in, decoded_data, error_detected);

        $display("\n=== Testbench Complete ===");
        $stop;
    end

endmodule

