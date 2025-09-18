`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module uart_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 500;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;

//-- PC port
    reg reset;
    reg rd_uart,wr_uart,rx;
    reg [7:0] w_data;
    wire tx_full,rx_empty,tx;
    wire [7:0] r_data;

//-- Instantiate the unit to test
uart UUT (
    .clk(clk),
    .reset(reset),
    .rd_uart(rd_uart),
    .wr_uart(wr_uart),
    .rx(rx),
    .w_data(w_data),
    .tx_full(tx_full),
    .rx_empty(rx_empty),
    .tx(tx),
    .r_data(r_data)
    );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, uart_tb);
  reset = 1'b0;
  #0.5
  rx = 1'b1;
    rd_uart = 1'b0;
    wr_uart = 1'b0;
    reset = 1'b1;
    #16
    reset = 1'b0;
    
    rx = 1'b0; //inicio
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1; //parada
    #16

    w_data = r_data;
    #16
    rx = 1'b0; //inicio

    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b1;
    #16
    rx = 1'b1;
    #16
    rx = 1'b1;
    #16
    rx = 1'b1; //parada
    #16
    w_data = r_data;
    #16    
    rx = 1'b0; //inicio

    #16
    rx = 1'b1;
    #16
    rx = 1'b1;
    #16
    rx = 1'b1;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1; //parada
    #16
    w_data = r_data;
    #16
    wr_uart = 1'b1;
    rd_uart = 1'b1;
    #2
    w_data = r_data;
    rd_uart = 1'b0;
    wr_uart = 1'b0;

   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule