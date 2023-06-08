module full_sub(a,b,c,di,bo);
input a,b,c;
output di,bo;
reg di,bo;

always@ (a,b,c,di,bo)
begin
    // for difference ----------------------------
  if(a==1'b0)
  begin
    if((b==1'b0 && c==1'b0) || (b==1'b1 && c==1'b1))
        di=1'b0;
    else
        di=1'b1;
  end

  if(a==1'b1)
  begin
    if((b==1'b0 && c==1'b0) || (b==1'b1 && c==1'b1))
        di=1'b1;
    else
        di=1'b0;
  end

//   for borrow ....................................

  if(a==1'b0)
  begin
    if((b==1'b0 && c==1'b0))
        bo=1'b0;
    else
        bo=1'b1;
  end

  if(a==1'b1)
  begin
    if((b==1'b1 && c==1'b1))
        bo=1'b1;
    else
        bo=1'b0;
  end
  
end
endmodule

module test;
reg a,b,c;
wire di,bo;

full_sub i(a,b,c,di,bo);
initial begin
    a=1'b0;
    b=1'b0;
    c=1'b0;
    $monitor("time:%0t a=%b, b=%b, c=%b di=%b, bo=%b",$time, a,b,c,di,bo);
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