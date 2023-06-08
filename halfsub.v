module half_sub(a,b,di,bo);
input a,b;
output di,bo;
reg di,bo;

always@ (a,b,di,bo)
begin
    // for difference .........................
    if((a==1'b0 && b==1'b0) || (a==1'b1 && b==1'b1))
        di=1'b0;
    else
        di=1'b1;
    // for borrow.................

    if(a==1'b0 && b==1'b1)
        bo=1'b1;
    else
        bo=1'b0;
end
endmodule

module test;
reg a,b;
wire di,bo;

half_sub i(a,b,di,bo);
initial begin
    a=1'b0;
    b=1'b0;
    $monitor("time:%0t a=%b b=%b di=%b bo=%b",$time, a,b,di,bo);
    #5 a=1'b0; b=1'b0;
    #5 a=1'b0; b=1'b1;
    #5 a=1'b1; b=1'b0;
    #5 a=1'b1; b=1'b1;
end
endmodule
