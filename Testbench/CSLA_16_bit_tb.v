`timescale 1ns / 1ps

module CLSA_16_bit_tb;

reg  [15:0] A, B;
reg        Cin;
wire [15:0] S;
wire       Co;


// DUT Instance
CLSA_16_bit uut(
    .A(A),
    .B(B),
    .Cin(Cin),
    .S(S),
    .Co(Co)
);

initial begin

    // Test 1
    A = 16'h0000; B = 16'h0000; Cin = 0;
    #10;
    // Test 2
    A = 16'h0001; B = 16'h0001; Cin = 0;
    #10;
    // Test 3
    A = 16'h00FF; B = 16'h0001; Cin = 0;
    #10;
    // Test 4
    A = 16'hFFFF; B = 16'h0001; Cin = 0;
    #10;
    // Test 5
    A = 16'h1234; B = 16'h5678; Cin = 1;
    #10;
    $finish;
end
endmodule
