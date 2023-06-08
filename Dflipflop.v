// module Dflipflop(D, clk, Q);
// input D, clk;
// output Q;
// reg Q;

// always @(posedge clk)
// begin
//   Q=D;
// end
// endmodule

// module test;
// reg D, clk;
// wire Q;

// Dflipflop i(D, clk, Q);
// initial 
// begin
//     D=1'b0;
//     clk=1'b0;
//     $monitor("Time:%f, D=%b, clk=%b, Q=%b",$time,D,clk,Q);
//     #5 D=1'b1; clk=1'b1;
//     #5 D=1'b0; clk=1'b0;
//     #5 D=1'b0; clk=1'b1;
//     #5 D=1'b1; clk=1'b1;

// end
// endmodule




