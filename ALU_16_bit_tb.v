`timescale 1ns / 1ps

module ALU_16_bit_tb;

reg  [15:0] A, B;
reg  [2:0]  opcode;
reg         Enable, clk;
wire [15:0] result;
wire        Cout;

// DUT
ALU_16_bit uut(
    .A(A),
    .B(B),
    .opcode(opcode),
    .Enable(Enable),
    .clk(clk),
    .result(result),
    .Cout(Cout)
);

// Clock
always #5 clk = ~clk;

initial begin
    clk = 0;
    Enable = 1;

    // Test ADD
    opcode = 3'b000;
    A = 16'h0005; B = 16'h0003;
    #20;

    // Test SUB
    opcode = 3'b001;
    A = 16'h0008; B = 16'h0003;
    #20;

    // Test OR
    opcode = 3'b010;
    A = 16'h00F0; B = 16'h0F0F;
    #20;

    // Test AND
    opcode = 3'b011;
    A = 16'h00F0; B = 16'h0F0F;
    #20;

    // Test XOR
    opcode = 3'b100;
    A = 16'hAAAA; B = 16'h5555;
    #20;

    // Test NOT
    opcode = 3'b101;
    A = 16'h0F0F; B = 0;
    #20;

    // Test SHIFT LEFT
    opcode = 3'b110;
    A = 16'h0001; B = 0;
    #20;

    // Test SHIFT RIGHT
    A = 16'h8000; B = 0;
    #20;

    $finish;
end

endmodule
