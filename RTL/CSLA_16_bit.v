`timescale 1ns / 1ps
module CSLA_16_bit(A,B,Cin,S,Co);
input [15:0] A,B;
input Cin;
output [15:0] S;
output Co;
wire c1,c2,c3,c40,c50,c60,c41,c51,c61,c70,c71,c80,c81,c90,c91,c100,c101,c110,c111,c120,c121,Com0,Com1,Com2;
    wire m1c0,m1c1,m2c0,m2c1,m3c0,m3c1;
    wire s40,s41,s50,s51,s60,s61,s70,s71,s80,s81,s90,s91,s100,s101,s110,s111,s120,s121,s130,s131,s140,s141,s150,s151;
    //First segment
    FA I1(A[0],B[0],Cin,S[0],c1);
    FA I2(A[1],B[1],c1,S[1],c2);
    FA I3(A[2],B[2],c2,S[2],c3);
    FA I4(A[3],B[3],c3,S[3],Com0);
    // Secong segment
    FA I50(A[4],B[4],1'b0,s40,c40);
    FA I51(A[4],B[4],1'b1,s41,c41);
    FA I60(A[5],B[5],c40,s50,c50);
    FA I61(A[5],B[5],c41,s51,c51);
    FA I70(A[6],B[6],c50,s60,c60);
    FA I71(A[6],B[6],c51,s61,c61);
    FA I80(A[7],B[7],c60,s70,m1c0);
    FA I81(A[7],B[7],c61,s71,m1c1);
    mux2x1 M1(s40,s41,Com0,S[4]);
    mux2x1 M2(s50,s51,Com0,S[5]);
    mux2x1 M3(s60,s61,Com0,S[6]);
    mux2x1 M4(s70,s71,Com0,S[7]);
    mux2x1 M5(m1c0,m1c1,Com0,Com1);
    // Third segment
    FA I90(A[8],B[8],1'b0,s80,c70);
    FA I91(A[8],B[8],1'b1,s81,c71);
    FA I100(A[9],B[9],c70,s90,c80);
    FA I101(A[9],B[9],c71,s91,c81);
    FA I110(A[10],B[10],c80,s100,c90);
    FA I111(A[10],B[10],c81,s101,c91);
    FA I120(A[11],B[11],c90,s110,m2c0);
    FA I121(A[11],B[11],c91,s111,m2c1);
    mux2x1 M6(s80,s81,Com1,S[8]);
    mux2x1 M7(s90,s91,Com1,S[9]);
    mux2x1 M8(s100,s101,Com1,S[10]);
    mux2x1 M9(s110,s111,Com1,S[11]);
    mux2x1 M10(m2c0,m2c1,Com1,Com2);
    // Fourth segment
     FA I130(A[12],B[12],1'b0,s120,c100);
    FA I131(A[12],B[12],1'b1,s121,c101);
    FA I140(A[13],B[13],c100,s130,c110);
    FA I141(A[13],B[13],c101,s131,c111);
    FA I150(A[14],B[14],c110,s140,c120);
    FA I151(A[14],B[14],c111,s141,c121);
    FA I160(A[15],B[15],c120,s150,m3c0);
    FA I161(A[15],B[15],c121,s151,m3c1);
    mux2x1 M11(s120,s121,Com2,S[12]);
    mux2x1 M12(s130,s131,Com2,S[13]);
    mux2x1 M13(s140,s141,Com2,S[14]);
    mux2x1 M14(s150,s151,Com2,S[15]);
    mux2x1 M15(m3c0,m3c1,Com2,Co);
endmodule

// Fuller adder
module FA(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
assign {cout,sum}=a+b+cin;
endmodule
// Multiplexer_2x1
module mux2x1(a,b,s,f);
input a,b,s;
output f;
assign f=(~s&a)|(s&b);
endmodule
