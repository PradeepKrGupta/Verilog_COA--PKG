module fourottwoEncodergate(y3,y2,y1,y0,w1,w0);
input y3,y2,y1,y0;
output w1,w0;

or i1(w0,y2,y3);
or i2(w1,y1,y3);

endmodule

module test;
reg y3,y2,y1,y0;
wire w1,w0;
fourottwoEncodergate i(y3,y2,y1,y0,w1,w0);
initial
begin
    y3=1'b0;
    y2=1'b0;
    y1=1'b0;
    y0=1'b0;
    $monitor("time:%0t,y3=%b,y2=%b,y1=%b,y0=%b,w1=%b,w0=%b",$time,y3,y2,y1,y0,w1,w0);
    #5 y3=1'b0; y2=1'b0; y1=1'b0; y0=1'b1; 
    #5 y3=1'b0; y2=1'b0; y1=1'b1; y0=1'b0; 
    #5 y3=1'b0; y2=1'b1; y1=1'b0; y0=1'b0; 
    #5 y3=1'b1; y2=1'b0; y1=1'b0; y0=1'b0; 
end
endmodule
