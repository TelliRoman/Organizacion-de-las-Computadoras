module IM(
    input wire [15:0] adress,
    output wire [31:0] rd
);
reg [31:0] memoria [65535:0];//(2^16)-1:0
//Instrucciones: 
initial begin
/*memoria[0] <= 32'h00002083; //lw x1,(x0)
memoria[4] <= 32'h00402103; //lw x2,4(x0)
memoria[8] <= 32'h002081b3; //add x3,x1,x2
memoria[12] <= 32'h00302423;//sw x3,8(x0)
memoria[16] <= 32'h00802203;//lw x4,8(x0)*/
memoria[4*0 ] <= 32'h00002283;
memoria[4*1 ] <= 32'h00100393;
memoria[4*2 ] <= 32'h00000e13;
memoria[4*3 ] <= 32'h00500e93;
memoria[4*4 ] <= 32'h00000f13;
memoria[4*5 ] <= 32'h00a00f93;
memoria[4*6 ] <= 32'h00000593;
memoria[4*7 ] <= 32'h00000613;
memoria[4*8 ] <= 32'h03000693;
memoria[4*9 ] <= 32'h00200713;
memoria[4*10 ] <= 32'h00300793;
memoria[4*11 ] <= 32'h00400813;
memoria[4*12 ] <= 32'h0082a303;
memoria[4*13 ] <= 32'h00730663;
memoria[4*14 ] <= 32'h07de0063;
memoria[4*15 ] <= 32'hff5ff06f;
memoria[4*16 ] <= 32'h0002a503;
memoria[4*17 ] <= 32'h01ee0a63;
memoria[4*18 ] <= 32'h027e0063;
memoria[4*19 ] <= 32'h04ee0063;
memoria[4*20 ] <= 32'h02fe0263;
memoria[4*21 ] <= 32'h030e0863;
memoria[4*22 ] <= 32'h40d50533;
memoria[4*23 ] <= 32'h03f50533;
memoria[4*24 ] <= 32'h00a585b3;
memoria[4*25 ] <= 32'h0280006f;
memoria[4*26 ] <= 32'h40d50533;
memoria[4*27 ] <= 32'h00a585b3;
memoria[4*28 ] <= 32'h01c0006f;
memoria[4*29 ] <= 32'h40d50533;
memoria[4*30 ] <= 32'h03f50533;
memoria[4*31 ] <= 32'h00a60633;
memoria[4*32 ] <= 32'h00c0006f;
memoria[4*33 ] <= 32'h40d50533;
memoria[4*34 ] <= 32'h00a60633;
memoria[4*35 ] <= 32'h01e2a423;
memoria[4*36 ] <= 32'h001e0e13;
memoria[4*37 ] <= 32'hf9dff06f;
memoria[4*38 ] <= 32'h02b60533;
memoria[4*39 ] <= 32'h3e800293;
memoria[4*40 ] <= 32'h02554333;
memoria[4*41 ] <= 32'h02556533;
memoria[4*42 ] <= 32'h06400293;
memoria[4*43 ] <= 32'h025543b3;
memoria[4*44 ] <= 32'h02556533;
memoria[4*45 ] <= 32'h00a00293;
memoria[4*46 ] <= 32'h02554e33;
memoria[4*47 ] <= 32'h02556533;
memoria[4*48 ] <= 32'h03030313;
memoria[4*49 ] <= 32'h03038393;
memoria[4*50 ] <= 32'h030e0e13;
memoria[4*51 ] <= 32'h03050513;
memoria[4*52 ] <= 32'h00002283;
memoria[4*53 ] <= 32'h0062a223;
memoria[4*54 ] <= 32'h0072a223;
memoria[4*55 ] <= 32'h01c2a223;
memoria[4*56 ] <= 32'h00a2a223;
memoria[4*57 ] <= 32'h00000593;
memoria[4*58 ] <= 32'h00000613;
memoria[4*59 ] <= 32'h00000e13;
memoria[4*60 ] <= 32'h00500e93;
//memoria[4*61 ] <= 32'hf41ff06f;
end
assign rd = memoria[adress];
endmodule
