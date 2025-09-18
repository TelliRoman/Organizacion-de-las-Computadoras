module adder(
    input [31:0] op1, op2,
    output [31:0] sal
);
assign sal = op1 + op2;
endmodule