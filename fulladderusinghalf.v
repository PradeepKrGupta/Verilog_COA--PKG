module halfadder(a,b,sum, carry);
input a,b;
output sum,carry;

and i1(carry,a,b);
xor i2(sum,a,b);
endmodule

module full_using_half(a,b,c,sum,carry);
input a,b,c;
output sum,carry;
wire w1,w2,w3;
halfadder i3(a,b,w1,w2);
halfadder i4(w1,c,sum,w3);
or i5(carry, w3,w2);

endmodule

module test;
reg a,b,c;
wire sum,carry;

full_using_half i(a,b,c,sum ,carry);
initial begin
  a=1'b0;
  b=1'b0;
  c=1'b0;
  $monitor("Time :%f, a=%b, b=%b, c=%b, sum=%b, carry=%b",$time, a,b,c,sum,carry);
  #5 a=1'b0; b=1'b0; c=1'b0;
  #5 a=1'b0; b=1'b0; c=1'b1;
  #5 a=1'b0; b=1'b1; c=1'b0;
  #5 a=1'b0; b=1'b1; c=1'b1;
  #5 a=1'b1; b=1'b0; c=1'b0;
  #5 a=1'b1; b=1'b0; c=1'b1;
  #5 a=1'b1; b=1'b1; c=1'b0;
  #5 a=1'b1; b=1'b1; c=1'b1;
end
endmodule