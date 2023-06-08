module halfsub(a,b,diff,borrow);
input a,b;
output diff,borrow;

xor i1(diff, a,b);
and i2(borrow, ~a,b);
endmodule

module fullsub_using_half(a,b,c,diff,borrow);
input a,b,c;
output diff,borrow;
wire w1,w2,w3;

halfsub i3(a,b,w1,w2);
halfsub i4(w1, c, diff, w3);
or i5(borrow, w2, w3);

endmodule

module test;
reg a,b,c;
wire diff,borrow;

fullsub_using_half i(a,b,c,diff ,borrow);
initial begin
  a=1'b0;
  b=1'b0;
  c=1'b0;
  $monitor("Time :%f, a=%b, b=%b, c=%b, diff=%b, borrow=%b",$time, a,b,c,diff,borrow);
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