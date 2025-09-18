module mainDeco(
    input wire [6:0] op,
    output reg branch, memWrite, aluSrc, regWrite, jump,
    output reg [1:0] immSrc, aluOp, resSrc
);

always @(*)
begin
    case (op)
        3: begin // lw
            regWrite <= 1'b1;
            immSrc <= 2'b00;
            aluSrc <= 1'b1;
            memWrite <= 1'b0;
            resSrc <= 2'b01;
            branch <= 1'b0;
            aluOp <= 2'b00;
            jump <= 1'b0;
        end

        35: begin // sw
            regWrite <= 1'b0;
            immSrc <= 2'b01;
            aluSrc <= 1'b1;
            memWrite <= 1'b1;
            branch <= 1'b0;
            aluOp <= 2'b00;
            jump <= 1'b0;
        end

        51: begin // R-type
            regWrite <= 1'b1;
            aluSrc <= 1'b0;
            memWrite <= 1'b0;
            resSrc <= 2'b00;
            branch <= 1'b0;
            aluOp <= 2'b10;
            jump <= 1'b0;
        end

        99: begin // beq
            regWrite <= 1'b0;
            immSrc <= 2'b10;
            aluSrc <= 1'b0;
            memWrite <= 1'b0;
            branch <= 1'b1;
            aluOp <= 2'b01;
            jump <= 1'b0;
        end

        19: begin // I-type
            regWrite <= 1'b1;
            immSrc <= 2'b00;
            aluSrc <= 1'b1;
            memWrite <= 1'b0;
            resSrc <= 2'b00;
            branch <= 1'b0;
            aluOp <= 2'b10;
            jump <= 1'b0;
        end

        111: begin // jal
            regWrite <= 1'b1;
            immSrc <= 2'b11;
            memWrite <= 1'b0;
            resSrc <= 2'b10;
            branch <= 1'b0;
            jump <= 1'b1;
        end

        default: begin 
            regWrite <= 1'bx;
            immSrc <= 2'bx;
            aluSrc <= 1'bx;
            memWrite <= 1'bx;
            resSrc <= 2'bx;
            branch <= 1'bx;
            aluOp <= 2'bx;
            jump <= 1'bx;
        end
    endcase
end
endmodule
