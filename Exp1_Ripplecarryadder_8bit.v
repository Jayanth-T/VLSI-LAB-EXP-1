module rippe_adder(S, Cout, X, Y,Cin);
 input [7:0] X, Y;// Two 4-bit inputs
 input Cin;
 output [7:0] S;
 output Cout;
 wire w1, w2, w3, w4, w5, w6, w7;
 fulladder u1(S[0], w1,X[0], Y[0], Cin);
 fulladder u2(S[1], w2,X[1], Y[1], w1);
 fulladder u3(S[2], w3,X[2], Y[2], w2);
 fulladder u4(S[3], w4,X[3], Y[3], w3);
 fulladder u5(S[4], w5,X[4], Y[4], w4);
 fulladder u6(S[5], w6,X[5], Y[5], w5);
 fulladder u7(S[6], w7,X[6], Y[6], w6);
 fulladder u8(S[7], Cout,X[7], Y[7], w7);
endmodule
module fulladder(S, Co, X, Y, Ci);
  input X, Y, Ci;
  output S, Co;
  wire w1,w2,w3;
  xor G1(w1, X, Y);
  xor G2(S, w1, Ci);
  and G3(w2, w1, Ci);
  and G4(w3, X, Y);
  or G5(Co, w2, w3);
endmodule
