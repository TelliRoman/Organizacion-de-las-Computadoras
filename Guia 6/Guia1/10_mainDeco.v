module mainDeco(
    input wire [6:0] op,
    output reg branch, memWrite, aluSrc, regWrite,
    output reg [1:0] resSrc, immSrc, aluOp
);

always @(*)
begin
    case (op)
        6: begin // lw
            regWrite <= 1'b1;
            immSrc <= 2'b00;
            aluSrc <= 1'b1;
            memWrite <= 1'b0;
            resSrc <= 1'b1;
            branch <= 1'b0;
            aluOp <= 2'b00;
        end

        35: begin // sw
            regWrite <= 1'b0;
            immSrc <= 2'b01;
            aluSrc <= 1'b1;
            memWrite <= 1'b1;
            branch <= 1'b0;
            aluOp <= 2'b00;
        end

        51: begin // R-type
            regWrite <= 1'b1;
            aluSrc <= 1'b0;
            memWrite <= 1'b0;
            resSrc <= 1'b0;
            branch <= 1'b0;
            aluOp <= 2'b10;
        end

        99: begin // beq
            regWrite <= 1'b0;
            immSrc <= 2'b10;
            aluSrc <= 1'b0;
            memWrite <= 1'b0;
            branch <= 1'b1;
            aluOp <= 2'b01;
        end
    endcase
end
endmodule
