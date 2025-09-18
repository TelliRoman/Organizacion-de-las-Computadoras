module SE(
    input wire [31:0] instr,
    input wire [1:0] src,
    output reg [31:0] immExt
);

always @(*) begin
    case(src)
        // I-type
        2'b00: immExt = {{20{instr[31]}}, instr[31:20]};

        // S-type
        2'b01: immExt = {{20{instr[31]}}, instr[31:25], instr[11:7]};

        // B-type
        2'b10: immExt = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};

        // J-type
        2'b11: immExt = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0};

        default: immExt = 32'bx;
    endcase
end

endmodule