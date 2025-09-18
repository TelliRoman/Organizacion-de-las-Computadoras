`include "Guia1\01_PC.v"
`include "Guia1\02_IM.v"
`include "Guia1\03_BR.v"
`include "Guia1\04_DM.v"
`include "Guia1\05_SE.v"
`include "Guia1\06_ALU.v"
`include "Guia1\07_ADD.v"
`include "Guia1\08_MUX2x1.v"
`include "Guia1\09_UC.v"
`include "Guia1\10_mainDeco.v"
`include "Guia1\11_aluDeco.v"

module TOP(
    input clk;
);

wire [15:0] T_pc;
wire [31:0] T_instr;
wire [31:0] T_res;
wire [31:0] T_DMrd;

RV32I RV32I_1(
    .clk(clk),
    .RV_pc(T_pc),
    .RV_instr(T_instr),
    .RV_res(T_res),
    .RV_DMrd(T_DMrd)
);

MEM MEM_1(
    .clk(clk),
    .M_pc(T_pc),
    .M_instr(T_instr),
    .M_res(T_res),
    .M_DMrd(T_DMrd)
);

endmodule