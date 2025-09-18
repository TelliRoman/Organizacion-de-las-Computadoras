`default_nettype none
`define DUMPSTR(x) `"x.vcd`"
`timescale 100 ns / 10 ns

module TOP_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 671;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;
 
//-- PC port
    reg rst;
    reg  rx;
    wire  tx;

//-- Instantiate the unit to test
TOP TOP_1 (
    .clk(clk),
    .rst(rst),
    .rx(rx),
    .tx(tx)
         );


initial begin

  //-- File were to store the simulation results
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, TOP_tb);
  #0.5
    rst = 1'b0;
  #2
  rx = 1'b1;
  rst=1'b1;
  #1
  rst= 1'b0;
  #1
  rx = 1'b0; //inicio
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1; 
    #16
  #1
  rx = 1'b0; //inicio
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1; 
    #16
  #1
  rx = 1'b0; //inicio
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1; 
    #16
  #1
  rx = 1'b0; //inicio
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1; 
    #16
  #1
  rx = 1'b0; //inicio
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1;
    #16
    rx = 1'b1;
    #16
    rx = 1'b0;
    #16
    rx = 1'b0;
    #16
    rx = 1'b1; 
    #16


   #(DURATION) $display("End of simulation");
  $finish;
end

endmodule