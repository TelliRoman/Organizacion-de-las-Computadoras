module BR(
    input wire clk, we,
    input wire [4:0] a1, a2, a3, 
    input wire [31:0] wd3,
    output wire [31:0] rd1, rd2
);

reg [31:0] banco [31:0];

always @(posedge clk) begin
    if (we) begin
        banco[a3] <= wd3;
    end
end

assign rd1 = (a1 != 0) ? banco[a1] : 1'b0;
assign rd2 = (a2 != 0) ? banco[a2] : 1'b0;

endmodule