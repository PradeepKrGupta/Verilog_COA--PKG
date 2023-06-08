module ttf(T, clk, Q, reset);
input T, clk, reset;
output Q;
reg Q;

always @(negedge clk)
begin 
    if(reset)
        Q=0;
    else begin
        if(T)
        Q=~Q;
        else
        Q=Q;
    end
end
endmodule

module test;
reg T,clk, reset;
wire Q;
always #5 clk = ~clk;
ttf i(T,clk, Q, reset);
initial 
begin
    T=1'b0; clk=1'b0; reset=1;
    $monitor("time:%f, T=%b, clk=%b, Q=%b",$time, T,clk,Q);
    #5 reset = 0;
    #5 T=1'b1;
    #5 T=1'b1;
    #5 T=1'b1;
    #5 T=1'b1;
    #5 $finish;
end
endmodule

             