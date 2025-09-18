`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module UC_09_tb();

parameter DURATION = 10;
reg clk = 0;
always #0.5 clk = ~clk;

reg op5, f7;
reg [1:0] aluOp;
reg [2:0] f3;
wire [2:0] aluControl;

aluDeco aluDeco_1 (
    .op5(op5),
    .f7(f7),
    .aluOp(aluOp),
    .f3(f3),
    .aluControl(aluControl)
);

initial begin
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, UC_09_tb);

    #1
    aluOp = 2'b00;

    #3
    aluOp = 2'b01;

    #3
    aluOp = 2'b10;
    f3 = 3'b000;
    op5 = 1'b0;
    f7 = 1'b0;

    #3
    f3 = 3'b000;
    op5 = 1'b1;
    f7 = 1'b1;

    #3
    f3 = 3'b010;

    #3
    f3 = 3'b110;

    #3
    f3 = 3'b111;

    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule