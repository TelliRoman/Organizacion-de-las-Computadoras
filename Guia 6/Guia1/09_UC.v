module UC(
    input wire f7,
    input wire [2:0] f3,
    input wire [6:0] op,
    input wire zero,
    output wire pcSrc, branch, resSrc, memWrite, ALUsrc, regWrite,
    output wire [2:0] ALUcontrol,
    output wire [1:0] immSrc
);

wire [1:0] aluOp;
// output reg main_branch, main_memWrite, main_aluSrc, main_regWrite,
// output reg [1:0] main_resSrc, main_immSrc, main_aluOp;

mainDeco mainDeco_1(
    .op(op),
    .branch(branch),
    .immSrc(immSrc),
    .memWrite(memWrite),
    .resSrc(resSrc),
    .aluSrc(aluSrc),
    .regWrite(regWrite),
    .aluOp(aluOp)
);

wire op5;
assign op5 = op[5];
// output reg [2:0] alu_aluControl;

aluDeco aluDeco_1(
    .op5(op5),
    .f3(f3),
    .f7(f7),
    .aluOp(aluOp),
    .aluControl(ALUcontrol)
);

endmodule