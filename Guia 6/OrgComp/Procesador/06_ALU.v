module ALU(
    input wire [31:0] srcA, srcB,
    input wire [2:0] ALUControl,
    output wire [31:0] res,
    output wire zero
);

reg [31:0] res1;
reg zero1;
assign res = res1;
assign zero = zero1;

always @(*) begin
    case (ALUControl)
        3'b000: res1 = srcA + srcB; 
        3'b001: res1 = srcA - srcB;
        3'b010: res1 = srcA & srcB;
        3'b011: res1 = srcA | srcB;
        3'b100: res1 = srcA * srcB;
        3'b101: begin
            res1[31:1] = 0;
            res1[0] = srcA < srcB;
        end
        3'b110: res1 = srcA / srcB;
        3'b111: res1 = srcA % srcB;
    endcase

    if (res == 0)
    begin
        zero1 = 1'b1;
    end else begin
        zero1 = 1'b0;
    end
end


endmodule