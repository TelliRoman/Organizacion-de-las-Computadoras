module DM(
    input wire clk, we,
    input wire [15:0] adress,
    input wire [31:0] wd,
    output wire [31:0] rd
);

reg [31:0] memoria [31:0];//(2^16)-1:0

/*always @(posedge clk)begin
    if(we) memoria[adress[15:2]] <= wd;
end */
always @(posedge clk)
    begin
        if (we)
            memoria[adress] <= wd;
    end
assign rd = memoria[adress];
initial begin
    memoria[0] <= 32'h0080;
    memoria[4] <= 32'd4;
end
endmodule