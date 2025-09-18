module DP(
    input wire clk,
    input wire DP_rst,
    input wire [31:0] DP_instr,
    input wire [31:0] DP_result,
    input wire DP_pcSrc, DP_ALUsrc, DP_regWrite,
    input wire [2:0] DP_ALUcontrol,
    input wire [1:0] DP_immSrc,
    output wire [15:0] DP_pc,
    output wire [31:0] DP_res,
    output wire [31:0] DP_rd2,
    output wire [31:0] DP_ADD2_sal,
    output wire DP_zero
);

// Instancio contador del programa y cables de conexión.
wire [15:0] pcNext;
wire [15:0] pc;

PC PC_1 (
    .clk(clk),
    .pcNext(pcNext),
    .pc(pc)
);

assign DP_pc = pc;

wire DP_we;
wire [4:0] DP_a1, DP_a2, DP_a3;
wire [31:0] DP_rd1, DP_rd2_aux, DP_wd3;

assign DP_a1 = DP_instr[19:15];
assign DP_a2 = DP_instr[24:20];
assign DP_a3 = DP_instr[11:7];
assign DP_we = DP_regWrite;
assign DP_wd3 = DP_result;

BR BR_1(
    .clk(clk),
    .we(DP_we),
    .a1(DP_a1), 
    .a2(DP_a2),
    .a3(DP_a3), 
    .rd1(DP_rd1),
    .rd2(DP_rd2_aux),
    .wd3(DP_wd3)
);
assign DP_rd2 = DP_rd2_aux;
wire [31:0] DP_immExt;

SE SE_1(
    .instr(DP_instr),   // input wire [31:0] instr,
    .src(DP_immSrc),    // input wire [1:0] src,
    .immExt(DP_immExt)  // output reg [31:0] immExt
);

wire [31:0] MUX1_e1, MUX1_e2, MUX1_sal ;
wire MUX1_sel;
assign MUX1_e1 = DP_rd2;
assign MUX1_e2 = DP_immExt;
assign MUX1_sel = DP_ALUsrc;

MUX2x1 MUX2x1_1(
    .e1(MUX1_e1),       //input wire [31:0] e1, e2,
    .e2(MUX1_e2),              
    .sel(MUX1_sel),     //input wire sel,
    .sal(MUX1_sal)      //output [31:0] sal
);

ALU ALU_1(
    .srcA(DP_rd1),                  //input wire [31:0] srcA, srcB,
    .srcB(MUX1_sal),
    .ALUControl(DP_ALUcontrol),     //input wire [2:0] ALUControl,
    .res(DP_res),                   //output wire [31:0] res
    .zero(DP_zero)
);

wire [31:0] ADD1_op1, ADD1_op2, ADD1_sal;
assign ADD1_op1 = pc;
assign ADD1_op2 = 3'b100;

adder ADD_1(
    .op1(ADD1_op1),     //input [31:0] op1, op2,
    .op2(ADD1_op2),
    .sal(ADD1_sal)      //output [31:0] sal
);

wire [31:0] ADD2_op1, ADD2_op2, ADD2_sal;
assign ADD2_op1 = DP_immExt;
assign ADD2_op2 = DP_pc;
assign DP_ADD2_sal = ADD2_sal;

adder ADD_2(
    .op1(ADD2_op1),     //input [31:0] op1, op2,
    .op2(ADD2_op2),
    .sal(ADD2_sal)      //output [31:0] sal
);

wire [31:0] MUX3_e1, MUX3_e2, MUX3_sal,MUX2_sal_rst;
wire MUX3_sel;
assign MUX3_e1 = ADD1_sal;
assign MUX3_e2 = ADD2_sal;
assign MUX3_sel = DP_pcSrc;

MUX2x1 MUX2x1_3(
    .e1(MUX3_e1),       //input wire [31:0] e1, e2,
    .e2(MUX3_e2),              
    .sel(MUX3_sel),     //input wire sel,
    .sal(MUX3_sal)      //output [31:0] sal
);

assign pcNext = DP_rst? 16'b0: MUX3_sal[15:0];

endmodule