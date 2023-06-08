module twotoFourDecoder(y3,y2,y1,y0,en,w1,w0);
input en,w1,w0;
output y3,y2,y1,y0;
wire i0,i1,i2;
not a1(i1,w1);
not a0(i0,w0);
not a2(i2,en);

and a2(y3,i2,i1,i0);
and a3(y2,i2,i1,w0);
and a4(y1,i2,w1,i0);
and a5(y0,i2,w1,w0);

endmodule

module test;
reg en,w1,w0;
wire y3,y2,y1,y0;
twotoFourDecoder i(y3,y2,y1,y0,en,w1,w0);
initial
begin
   en=1'b0;
   w1=1'b0;
   w0=1'b0;

    $monitor("time:%0t,en=%b,w1=%b,w0=%b,y3=%b,y2=%b,y1=%b,y0=%b",$time,en,w1,w0,y3,y2,y1,y0);
    #5 en=1'b0; w1=1'b0; w0=1'b0;
    #5 en=1'b0; w1=1'b0; w0=1'b1;
    #5 en=1'b0; w1=1'b1; w0=1'b0;
    #5 en=1'b0; w1=1'b1; w0=1'b1;
end
endmodule