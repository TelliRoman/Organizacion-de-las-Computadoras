module aluDeco(
    input wire op5,f7,f7_0,
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
                /*if(op5== 1 && f7 ==1 && f7_0 ==0)  aluControl <= 3'b001;// f7[5]=1 y f7[0]=0
                if(op5== 0 && f7 ==0 && f7_0 ==0)  aluControl <= 3'b000;//f7[5]=0 y f7[0]=0
                if(op5== 0 && f7 ==1 && f7_0 ==0)  aluControl <= 3'b000;
                if(op5== 1 && f7 ==0 && f7_0 ==0)  aluControl <= 3'b000;
                if(op5== 0 && f7 ==0 && f7_0 ==0)  aluControl <= 3'b000;
                if(op5==1 && f7 ==0 && f7_0 ==1)  aluControl <= 3'b100;//mul //f7[5]=0 y f7[0]=1*/
                if(op5==0) aluControl <= 3'b000; 
                if(op5== 1 && f7 ==0 && f7_0 ==0)  aluControl <= 3'b000;
                if(op5==1 && f7 ==0 && f7_0 ==1)  aluControl <= 3'b100;
                if(op5== 1 && f7 ==1 && f7_0 ==0)  aluControl <= 3'b001;
            end
            3'b100: aluControl <= 3'b110;//div //f7[5]=0 y f7[0]=1
            3'b010: aluControl <= 3'b101;

            3'b110: begin
                if(f7 ==0 && f7_0 ==1)aluControl <= 3'b111; // rem //si f7[0] esta en 1
                if(f7 ==0 && f7_0 ==0)aluControl <= 3'b011; //si f7[0] esta en 0 
            end
            3'b111: aluControl <= 3'b010;
        endcase
    end

    default: aluControl <= 3'bx;

    endcase
end

endmodule