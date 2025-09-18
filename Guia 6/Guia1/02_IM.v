module IM(
    input wire [15:0] adress,
    output wire [31:0] rd
);
reg [31:0] memoria [63:0];

assign rd = memoria[adress];
endmodule