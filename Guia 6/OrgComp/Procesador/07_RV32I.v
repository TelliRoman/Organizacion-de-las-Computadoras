module RV32I(
    input wire clk,
    input wire RV_rst,
    input wire [31:0] RV_instr,
    input wire [31:0] RV_result,
    output wire [15:0] RV_pc,
    output wire [31:0] RV_res,
    output wire [31:0] RV_rd2,
    output wire [31:0] RV_ADD2_sal,
    output wire [1:0] RV_resSrc,
    output wire RV_memWrite
);

DP DP_1(
    .clk(clk),
    .DP_rst(RV_rst),
    .DP_pc(RV_pc),
    .DP_res(RV_res),
    .DP_result(RV_result),
    .DP_rd2(RV_rd2),
    .DP_pcSrc(UC_pcSrc),
    .DP_instr(RV_instr),
    .DP_ALUsrc(UC_ALUsrc),
    .DP_regWrite(UC_regWrite),
    .DP_ALUcontrol(UC_ALUcontrol),
    .DP_immSrc(UC_immSrc),
    .DP_zero(UC_zero),
    .DP_ADD2_sal(RV_ADD2_sal)
);

wire UC_f7,UC_f7_0;
wire [2:0] UC_f3;
wire [6:0] UC_op;
wire UC_zero;
wire UC_pcSrc, UC_branch, UC_memWrite, UC_ALUsrc, UC_regWrite;
wire [2:0] UC_ALUcontrol;
wire [1:0] UC_immSrc, UC_resSrc;

assign UC_f7 = RV_instr[30];
assign UC_f3 = RV_instr[14:12];
assign UC_op = RV_instr[6:0];
assign UC_f7_0 = RV_instr[25];
UC UC_1(
    .f7(UC_f7),// input wire f7[5],
    .f7_0(UC_f7_0),
    .f3(UC_f3),// input wire [2:0] f3,
    .op(UC_op),// input wire [6:0] op,
    .zero(UC_zero),// input wire zero,
    .pcSrc(UC_pcSrc),// output wire pcSrc, branch, resSrc, memWrite, ALUsrc, regWrite,
    .resSrc(UC_resSrc),
    .memWrite(UC_memWrite),
    .ALUsrc(UC_ALUsrc),
    .regWrite(UC_regWrite),
    .ALUcontrol(UC_ALUcontrol),// output wire [2:0] ALUcontrol,
    .immSrc(UC_immSrc)// output wire [1:0] immSrc
);

assign RV_resSrc = UC_resSrc;
assign RV_memWrite = UC_memWrite;

endmodule