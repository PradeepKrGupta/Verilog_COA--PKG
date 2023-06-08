module demux(d,a,b,z0,z1,z2,z3);
input a,b,d;
output z0,z1,z2,z3;
wire w1,w2;
not g1(w1, a);
not g1(w2, b);
and g3(z0, d,w1,w2);
and g4(z1, d,w1,w2);
and g5(z2, d,a,w2);
and g6(z3, d,a,b);
endmodule

module test;
reg a,b,d;
wire z0,z1,z2,z3;
demux i(d,a,b,z0,z1,z2,z3);
initial
begin
    a=1'b0;
    b=1'b0;
    d=1'b0;
    $monitor("time:%0t, d=%b, a=%b, b=%b, z0=%b, z1=%b, z2=%b, z3=%b",$time,d,a,b,z0,z1,z2,z3);
    #5 d=1'b0; a=1'b0; b=1'b0;
    #5 d=1'b0; a=1'b0; b=1'b1;
    #5 d=1'b0; a=1'b1; b=1'b0;
    #5 d=1'b0; a=1'b1; b=1'b1;
    #5 d=1'b1; a=1'b0; b=1'b0;
    #5 d=1'b1; a=1'b0; b=1'b1;
    #5 d=1'b1; a=1'b1; b=1'b0;
    #5 d=1'b1; a=1'b1; b=1'b1;
end
endmodule