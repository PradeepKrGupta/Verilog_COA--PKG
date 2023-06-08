// Two to one multiplexer using gate method

module twotoone(a,b,c,out);
input a,b,c;
output out;
wire w1,w2,w3;

not g1(w1, c);
and g2(w2, a, w1);
and g3(w3, b, c);
or g4(out, w2, w3);
endmodule

module test;
reg a,b,c;
wire out;
twotoone t(a,b,c,out);
initial
begin
    a=1'b0;
    b=1'b0;
    c=1'b0;
    $monitor("time:%0t a=%b b=%b c=%b out=%b",$time, a, b,c,out);

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