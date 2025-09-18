module aluDeco(
    input wire op5,f7,
    input wire [1:0] aluOp,
    input wire [2:0] f3,
    output reg [2:0] aluControl
);

always @(*)
begin
    case (aluOp)
    2'b00: begin
        aluControl <= 3'b000;
    end

    2'b01: begin
        aluControl <= 3'b001;
    end

    2'b10: begin
        case (f3)
            3'b000: begin
                if (op5 == 1 && f7 == 1)
                    aluControl <= 3'b001;
                else aluControl <= 3'b000;
            end

            3'b010: aluControl <= 3'b101;

            3'b110: aluControl <= 3'b011;

            3'b111: aluControl <= 3'b010;
        endcase
    end

    endcase
end

endmodule