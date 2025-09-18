//Listing 8.4
module uart
   #( // Default setting:
      // 19,200 baud, 8 data bits, 1 stop bit, 2^2 FIFO
      parameter DBIT = 8,     // # data bits
                SB_TICK = 16, // # ticks for stop bits, 16/24/32
                              // for 1/1.5/2 stop bits
                DVSR = 1,//163,   // baud rate divisor
                              // DVSR = 50M/(16*baud rate)
                DVSR_BIT = 1,//8 // # bits of DVSR
                FIFO_W = 2    // # addr bits of FIFO
                              // # words in FIFO=2^FIFO_W
   )
   (
    input wire clk, reset,
    input wire rd_uart, wr_uart, rx, //Recibe si quiere leer con rd_uart, lo que va a leer por rx, y lo saca por r_data
    input wire [7:0] w_data,         //Recibe si quiere escribir por wr_uart, lo que va a escribir por w_data, y lo trasmite
                                     // a traves de tx en serie
    output wire tx_full, rx_empty, tx,
    output wire [7:0] r_data
   );
  

   // signal declaration
   wire tick, rx_done_tick, tx_done_tick;
   wire tx_empty, tx_fifo_not_empty;
   wire [7:0] tx_fifo_out, rx_data_out;

   //body
   mod_m_counter #(.M(DVSR), .N(DVSR_BIT)) baud_gen_unit
      (.clk(clk), .reset(reset), .q(), .max_tick(tick)); //Cada 163 clk, saca un 1 por el wire tick

   uart_rx #(.DBIT(DBIT), .SB_TICK(SB_TICK)) uart_rx_unit
      (.clk(clk), .reset(reset), .rx(rx), .s_tick(tick),
       .rx_done_tick(rx_done_tick), .dout(rx_data_out)); //saca el dato leido en rx_data_out y que termino la lectura en rx_donde_tick

   flag_buf #(.W(DBIT)) flag_buf_rx_unit (
      .clk(clk), .reset(reset), 
      .clr_flag(rd_uart),
      .set_flag(rx_done_tick),
      .din(rx_data_out),
      .flag(rx_empty),
      .dout(r_data)
   );
   
   fifo #(.B(DBIT), .W(FIFO_W)) fifo_tx_unit
      (.clk(clk), .reset(reset), .rd(tx_done_tick),
       .wr(wr_uart), .w_data(w_data), .empty(tx_empty),
       .full(tx_full), .r_data(tx_fifo_out));

   uart_tx #(.DBIT(DBIT), .SB_TICK(SB_TICK)) uart_tx_unit
      (.clk(clk), .reset(reset), .tx_start(tx_fifo_not_empty),
       .s_tick(tick), .din(tx_fifo_out),
       .tx_done_tick(tx_done_tick), .tx(tx));

   assign tx_fifo_not_empty = ~tx_empty;
endmodule