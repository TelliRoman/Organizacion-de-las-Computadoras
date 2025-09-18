module DM(
    input wire clk, we,
    input wire [15:0] adress,
    input wire [31:0] wd,
    output reg [31:0] rd
);

reg [31:0] memoria [31:0];

always @(posedge clk)
    begin
        if (we)
            memoria[adress] <= wd;
        if (~we)
            rd <= memoria[adress];
    end
endmodule