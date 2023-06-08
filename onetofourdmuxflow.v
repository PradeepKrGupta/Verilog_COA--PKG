module onetofour(d,s0,s1,y1,y2,y3,y4);
input d,s0,s1;
output y1,y2,y3,y4;
wire w0,w1;
assign w0=~s0;
assign w1=~s1;
assign y1=(d&w0&w1);
assign y2=(d&w0&s1);
assign y3=(d&s0&w1);
assign y4=(d&s0&s1);

endmodule

module test;
reg d,s0,s1;
wire y1,y2,y3,y4;

onetofour i(d,s0,s1,y1,y2,y3,y4);
initial begin
    d=1'b0;
    s0=1'b0;
    s1=1'b0;
    $monitor("time:%0t,s0=%b,s1=%b,d=%b,y1=%b,y2=%b,y3=%b,y4=%b",$time,s0,s1,d,y1,y2,y3,y4);
    #5 s0=1'b0; s1=1'b0; d=1'b0; 
    #5 s0=1'b0; s1=1'b0; d=1'b1; 
    #5 s0=1'b0; s1=1'b1; d=1'b0; 
    #5 s0=1'b0; s1=1'b1; d=1'b1; 
    #5 s0=1'b1; s1=1'b0; d=1'b0; 
    #5 s0=1'b1; s1=1'b0; d=1'b1; 
    #5 s0=1'b1; s1=1'b1; d=1'b0; 
    #5 s0=1'b1; s1=1'b1; d=1'b1; 
end
endmodule