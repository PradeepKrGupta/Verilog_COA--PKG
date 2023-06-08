module dff(D, clk, Q);
input D, clk;
output  Q;
reg Q;

always @(posedge clk)
begin
    Q=D;
end
endmodule

module SISO(in, clk, out);
input in, clk;
output out;
wire [2:0] Q;

dff i1(in , clk, Q[0]);
dff i2(Q[0] , clk, Q[1]);
dff i3(Q[1] , clk, Q[2]);
dff i4(Q[2] , clk, out);

endmodule

module test;
reg in, clk;
wire out;

SISO i(in, clk, out);
always #5 clk =~clk;
initial
begin
    in=1'b0;clk=1'b0;
    $monitor("Time :%f, in:%b, clk:%b, out:%b",$time, in, clk, out);
    #10 in=1'b1;
    #10 in=1'b1;
    #10 in=1'b1;
    #10 in=1'b1;
    #80 $finish;
end
endmodule




