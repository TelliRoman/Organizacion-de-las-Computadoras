`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module Ej_01_tb();

parameter DURATION = 10;
reg clk = 0;
always #0.5 clk = ~clk;

reg [15:0] test_pcNext;
wire [15:0] test_pc;
PC PC_1 (
    .clk(clk),
    .pcNext(test_pcNext),
    .pc(test_pc)
);

reg [15:0] test_adress;
wire [31:0] test_rd;
IM IM_1(
    .adress(test_adress),
    .rd(test_rd)
);

reg test_we;
reg [4:0] test_a1, test_a2, test_a3;
reg [31:0] test_wd3;
wire [31:0] test_rd1, test_rd2;
BR BR_1(
    .clk(clk),
    .we(test_we),
    .a1(test_a1),
    .a2(test_a2),
    .a3(test_a3),
    .wd3(test_wd3),
    .rd1(test_rd1),
    .rd2(test_rd2)
);

initial begin
    $dumpfile(`DUMPSTR(`VCD_OUTPUT));
    $dumpvars(0, Ej_01_tb);

    test_we = 1;
    test_a1 = 0;
    test_a2 = 1;
    test_a3 = 0;
    test_wd3 = 0;
    
    #1
    test_pcNext = 0;
    test_adress = 0;

    test_a3 = 1;
    test_wd3 = 1;

    #5
    test_pcNext = 1;
    test_adress = 1;

    test_a3 = 2;
    test_wd3 = 2;

    #5
    test_pcNext = 2;
    test_adress = 2;

    test_we = 0;


    #5
    test_pcNext = 3;
    test_adress = 3;

    test_a1 = 2;
    test_a2 = 3;

    #(DURATION) $display("End of simulation");
    $finish;
end

endmodule