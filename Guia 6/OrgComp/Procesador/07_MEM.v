
module MEM(
    input wire clk,
    input wire [15:0] M_pc, 
    output wire [31:0] M_instr,
    input wire [31:0] M_res,
    output wire [31:0] M_result,
    input wire [31:0] M_wd,
    input wire [31:0] M_ADD2_sal,
    input wire [1:0] M_resSrc,
    input wire M_memWrite,
    output wire rd_uart,
    output wire wr_uart,
    input wire tx_full,
    input wire rx_empty,
    input wire[7:0] r_data,
    output wire[7:0] w_data
);
reg [7:0] M_reg_w_data;
reg [31:0] result_uart;
wire [31:0] result_DM;
reg [31:0] M_reg_r_data,M_reg_rx_empty,M_reg_tx_full;
reg M_reg_rd_uart, M_reg_wr_uart;

IM IM_1(
    .adress(M_pc), 
    .rd(M_instr)
);
wire [15:0] addr_virtual = M_res[15:0];
wire [1:0] M_block_select;
wire [15:0] addr_phisical;
MMU MMU_1(
    .address_virtual(addr_virtual),
    .block_select(M_block_select),
    .address_phisical(addr_phisical)
);
wire selcUart = M_block_select[1];
wire selcDM = M_block_select[0];
DM DM_1(
        .clk(clk),          //input wire clk, we,
        .we(M_memWrite && ~selcDM),
        .adress(addr_phisical), //input wire [15:0] adress,
        .wd(M_wd),          //input wire [31:0] wd,
        .rd(result_DM)          //output reg [31:0] rd
        );
wire [31:0] MUX2_e1, MUX2_e2, MUX2_e3, MUX2_sal;
wire [1:0] MUX2_sel;
assign MUX2_e1 = M_res;//resultado de la alu
assign MUX2_e2 = result_DM;//dato q sale de memoria de datos
assign MUX2_e3 = M_ADD2_sal; //para hacer salto incondicional 
assign MUX2_sel = M_resSrc; //señal de multiplexor de la UNIDAD DE CONTROL PARA MOSTRAR DSP de la mem de datos
MUX3x1 MUX3x1_2(
    .e1(MUX2_e1),       //input wire [31:0] e1, e2,
    .e2(MUX2_e2),
    .e3(MUX2_e3),
    .sel(MUX2_sel),     //input wire sel,
    .sal(MUX2_sal)     //output [31:0] sal
);
always @*begin
    M_reg_rx_empty = {31'b0,rx_empty};
    M_reg_tx_full = {31'b0,tx_full};
    M_reg_r_data = {24'b0,r_data};
    M_reg_w_data = 8'b0;
    M_reg_wr_uart = 1'b0;
    M_reg_rd_uart = 1'b0;
    result_uart = 32'b0;
    if(addr_phisical==16'h0000 && selcUart)//Leer el dato escrito por un periferico en la uart
        begin
            result_uart=M_reg_r_data;
            M_reg_rd_uart = 1'b1;
        end
    if(M_memWrite && addr_phisical== 16'h0004 && selcUart) begin //Escribir el dato en la uart para transmitir
            M_reg_w_data <= M_wd[7:0]; 
            M_reg_wr_uart = 1'b1;
        end  
    if(addr_phisical== 16'h0008 && selcUart)begin
        result_uart=M_reg_rx_empty;
    end
    if(addr_phisical== 16'h000c && selcUart)begin
        result_uart=M_reg_tx_full;
    end
end
assign rd_uart = M_reg_rd_uart;
assign wr_uart = M_reg_wr_uart;
assign w_data = M_reg_w_data;
assign M_result = selcUart ? (result_uart) : MUX2_sal;
endmodule