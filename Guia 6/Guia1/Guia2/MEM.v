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
module MEM (
    input wire M_pc,
    input wire CLK,
    input wire [31:0] M_res,
    output wire [31:0] M_instr,
    output wire[31:0] M_DMrd
);

IM im1 (
    .adress(M_pc),
    .rd(M_instr);
);

wire [31:0] M_rd,
DM dm1 (
    .clk(CLK),
    .we(),
    .adress(M_res),
    .wd(),
    .rd(M_DMrd)
);

endmodule