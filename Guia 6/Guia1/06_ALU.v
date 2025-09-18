module ALU(
    input wire [31:0] srcA, srcB,
    input wire [2:0] ALUControl,
    output wire [31:0] res
);

reg [31:0] res1;
assign res = res1;

always @(*) begin
    case (ALUControl)
        3'b000: res1 = srcA + srcB; 
        3'b001: res1 = srcA - srcB;
        3'b010: res1 = srcA & srcB;
        3'b011: res1 = srcA | srcB;
        3'b101: begin
            res1[31:1] = 0;
            res1[0] = srcA < srcB;
        end
        
        default: res1 = 0;
    endcase
end


endmodule