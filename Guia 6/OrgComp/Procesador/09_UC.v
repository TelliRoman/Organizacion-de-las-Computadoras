module UC(
    input wire f7,f7_0,
    input wire [2:0] f3,
    input wire [6:0] op,
    input wire zero,
    output wire pcSrc, memWrite, ALUsrc, regWrite,
    output wire [2:0] ALUcontrol,
    output wire [1:0] immSrc, resSrc
);

wire [1:0] UC_aluOp;
wire branch, jump;

mainDeco mainDeco_1(
    .op(op),
    .branch(branch),
    .jump(jump),
    .immSrc(immSrc),
    .memWrite(memWrite),
    .resSrc(resSrc),
    .aluSrc(ALUsrc),
    .regWrite(regWrite),
    .aluOp(UC_aluOp)
);

wire UC_op5;
assign UC_op5 = op[5];

aluDeco aluDeco_1(
    .op5(UC_op5), 
    .f3(f3),
    .f7(f7),
    .f7_0(f7_0),
    .aluOp(UC_aluOp),
    .aluControl(ALUcontrol)
);

assign pcSrc = (zero & branch) | jump;

endmodule