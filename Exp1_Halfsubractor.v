module half_subtractor(D,Bo,A,B);
input A,B;
output D,Bo;
assign D=A^B;
assign Bo=(~A)&B;
endmodule
