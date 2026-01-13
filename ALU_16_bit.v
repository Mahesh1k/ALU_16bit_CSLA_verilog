`timescale 1ns / 1ps
module ALU_16_bit(A,B,opcode,Enable,clk,result,Cout

    );
    input [15:0] A,B;
    input clk,Enable;
    input [2:0] opcode;
    output reg [15:0] result;
    output reg Cout;
    parameter OP_ADD=3'b000, OP_SUB=3'b001, OP_OR=3'b010, OP_AND=3'b011, OP_XOR=3'b100, OP_NOT=3'b101, SHIFT_LEFT=3'b110, SHIFT_RIGHT=3'b111;
wire [15:0] sum_csla;
wire carry_csla;
reg [15:0] B_comp;
always @(*) begin
if (opcode==3'b001)
B_comp=~B;
else
B_comp=B;
end
CSLA_16_bit I1(.A(A),.B(B_comp),.Cin((opcode==OP_SUB)?1'b1:1'b0),.S(sum_csla),.Co(carry_csla));

// ALU operation
always @(posedge clk) begin
if (Enable) begin
case (opcode)
OP_ADD,OP_SUB: begin
     result<=sum_csla;
     Cout<=carry_csla; end
OP_OR: begin result<=A|B; Cout<=1'b0; end
OP_AND: begin result<=A&B; Cout<=1'b0; end
OP_XOR: begin result<=A^B; Cout<=1'b0; end
OP_NOT: begin result<=~A; Cout<=1'b0; end
SHIFT_LEFT: begin result<=A<<1; Cout<=1'b0; end
SHIFT_RIGHT: begin result<=A>>1; Cout<=1'b0; end
endcase
end
end
endmodule
