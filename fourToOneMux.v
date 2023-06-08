module fourToOne(a,b,c,d,s0,s1,y);
input a,b,c,d,s0,s1;
output y;

wire w0, w1, out1, out2, out3, out4;

not g1(w1,s1);
not g2(w0,s0);
and g3(out1, s1, s0, d);
and g4(out2, s1,w0, c);
and g5(out3, w1,s0, b);
and g6(out4, w1,w0, a);

or g7(y, out1, out2, out3, out4);

endmodule

module test;
reg a,b,c,d,s0,s1;
wire y;
fourToOne i(a,b,c,d,s0,s1,y);
initial begin
    a=1'b0;
    b=1'b0;
    c=1'b0;
    d=1'b0;
    s0=1'b0;
    s1=1'b0;
    $monitor("Time:time:%0t, a=%b, b=%b, c=%b, d=%b, s0=%b, s1=%b, y=%b",$time, a,b,c,d,s0,s1,y);
    #5 a=1'b0; b=1'b0; c=1'b0; d=1'b0; s0=1'b1; s1=1'b0;
    #5 a=1'b0; b=1'b1; c=1'b1; d=1'b1; s0=1'b0; s1=1'b1;
    #5 a=1'b0; b=1'b0; c=1'b1; d=1'b1; s0=1'b1; s1=1'b0;
    #5 a=1'b0; b=1'b1; c=1'b0; d=1'b0; s0=1'b0; s1=1'b1;

end
endmodule