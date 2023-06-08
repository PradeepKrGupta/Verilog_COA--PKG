module half_adder(a, b, carry, sum);
input a, b;
output carry , sum;

and g1(carry, a, b);
xor g2(sum, a, b);
endmodule

module half_adder_tb;
reg a, b;
wire carry, sum;

half_adder i(a, b, carry, sum);
initial
begin
    a=1'b0;
    b=1'b0;
    $monitor("Time:%0t a=%b b=%b carry=%b sum=%b",$time, a, b,carry, sum);
    #5 a=1'b0; b=1'b0;
    #5 a=1'b0; b=1'b1;
    #5 a=1'b1; b=1'b0;
    #5 a=1'b1; b=1'b1;

end
endmodule