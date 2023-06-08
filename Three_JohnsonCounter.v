module dff(D,clk,Q,reset);
input D,clk,reset;
output Q;
reg Q;

always @(posedge clk)
begin
    if(reset) begin
    Q=0;
    end
    else begin
        Q=D;
    end
end
endmodule

module Dff_Jhonson(clk, Q, reset);
input clk, reset;
output [3:0]Q;

dff i1(~Q[0], clk, Q[3], reset);
dff i2(Q[3], clk, Q[2], reset);
dff i3(Q[2], clk, Q[1], reset);
dff i4(Q[1], clk, Q[0], reset);

endmodule

module test;
reg clk, reset;
wire [3:0]Q;

Dff_Jhonson i(clk, Q, reset);
always #5 clk = ~clk;
initial
begin
    clk=1'b0; reset=1'b1;
    $monitor("Time : %f, clk=%b, Q=%4b",$time, clk, Q);
    #10 reset=1'b0;
    #100 $finish;
end
endmodule




// module dff(D, clk, Q, reset);
// input D, clk, reset;
// output Q;
// reg Q;

// always @(posedge clk)
// begin
//     if(reset) begin
//     Q=0;
//     end
//     else begin
//     Q=D;
//     end
// end
// endmodule

// module JohnsonCounter(clk, Q, reset);
// input clk, reset;
// output [3:0] Q;

// dff i1(~Q[0], clk, Q[3], reset);
// dff i2(Q[3], clk, Q[2], reset);
// dff i3(Q[2], clk, Q[1], reset);
// dff i4(Q[1], clk, Q[0], reset);
// endmodule

// module test;
// reg clk, reset;
// wire [3:0] Q;

// JohnsonCounter i(clk, Q, reset);
// always #5 clk = ~clk;
// initial begin
//     clk = 1'b0;
//     reset = 1'b1;
//     $monitor("Time : %f, clk=%b, Q=%4b",$time, clk,Q);
//     #10 reset = 1'b0;
//     #100 $finish;
// end
// endmodule
    