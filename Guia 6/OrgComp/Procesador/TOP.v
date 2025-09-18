module TOP(
    input wire clk,
    input wire rst,
    input wire rx,
    output wire tx
);

wire [15:0] T_pc;
wire [31:0] T_instr;
wire [31:0] T_res;
wire [31:0] T_result;
wire [31:0] T_rd2;
wire [31:0] T_ADD2_sal;
wire [1:0] T_resSrc; 
wire T_memWrite;
 
RV32I RV32I_1(
    .clk(clk),
    .RV_rst(rst),
    .RV_pc(T_pc),
    .RV_instr(T_instr),
    .RV_res(T_res),
    .RV_result(T_result),
    .RV_rd2(T_rd2),
    .RV_resSrc(T_resSrc),
    .RV_memWrite(T_memWrite),
    .RV_ADD2_sal(T_ADD2_sal)
); 
wire [7:0]T_r_data;
wire T_rx_empty;
wire T_rd_uart;
wire T_tx_full;
wire T_wr_uart;
wire [7:0]T_w_data;
uart uart_1(
.clk(clk),
.reset(rst),
.rd_uart(T_rd_uart), //señal creada por el procesador dsp de leer de la uart HACER
.wr_uart(T_wr_uart), //señales salidas de los reg de mem_uart
.rx(rx),
.w_data(T_w_data), 
.tx_full(T_tx_full),
.rx_empty(T_rx_empty),
.tx(tx),
.r_data(T_r_data)
);
MEM MEM_1(
.clk(clk),
.M_pc(T_pc),
.M_instr(T_instr),
.M_res(T_res),
.M_result(T_result),
.M_wd(T_rd2),
.M_resSrc(T_resSrc),
.M_memWrite(T_memWrite),
.M_ADD2_sal(T_ADD2_sal),
.rd_uart(T_rd_uart),
.wr_uart(T_wr_uart),
.tx_full(T_tx_full),
.rx_empty(T_rx_empty),
.r_data(T_r_data),
.w_data(T_w_data)
);
endmodule