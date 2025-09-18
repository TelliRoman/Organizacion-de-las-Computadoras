module MUX2x1(
    input wire [31:0] e1, e2,
    input wire sel,
    output [31:0] sal
);

//assign sal = (e1&~sel) | (e2&sel);
assign sal = sel? e2 : e1;

endmodule