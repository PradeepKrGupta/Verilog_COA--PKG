module half_adder(a, b, sum, carry);
input a,b;
output sum, carry;

and g1(carry, a, b);
xor g2(sum , a, b);
endmodule

module full_adder_using_HA(a, b, c,sum, carry);
input a, b, c;
output sum, carry;

wire w1, w2, w3;

half_adder g3(a, b, w1, w2);
half_adder g4(w1, c, sum, w3);
or g1(carry, w2, w3);
endmodule

module full_adder_tb;
reg a, b, c;
wire sum, carry;
full_adder_using_HA i(a, b, c, sum ,carry);
initial begin
    a=1'b0;
    b=1'b0;
    c=1'b0;
    $monitor("Time:%0t a=%b b=%b c=%b sum=%b carry=%c",$time, a, b, c, sum , carry);

    #10 a=1'b0; b=1'b0; c=1'b0;
    #10 a=1'b0; b=1'b0; c=1'b1;
    #10 a=1'b0; b=1'b1; c=1'b0;
    #10 a=1'b0; b=1'b1; c=1'b1;
    #10 a=1'b1; b=1'b0; c=1'b0;
    #10 a=1'b1; b=1'b0; c=1'b1;
    #10 a=1'b1; b=1'b1; c=1'b0;
    #10 a=1'b1; b=1'b1; c=1'b1;
end
endmodule
