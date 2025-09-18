/* module MMU(
 input wire [15:0] address_virtual,
 output reg [1:0] block_select,
 output reg [15:0] address_phisical
);
// Definición de direcciones virtuales
parameter DATA_ADDRESS = 16'h0300; //16'h2000
parameter STACK_ADDRESS =16'h0400; //16'h3ffc;
parameter MMIO_ADDRESS = 16'hfb00; //16'h7f00
// Definición de tamaño de bloque (32 registros de 32 bits)
parameter BLOCK_SIZE = 32;
// Mapeo de direcciones virtuales a bloques de datos
always @(*) begin
 block_select = 2'b00;
 if (address_virtual >= DATA_ADDRESS && address_virtual < STACK_ADDRESS)
begin
 // Acceso al bloque .data
 block_select = 2'b00;
 address_phisical = address_virtual - DATA_ADDRESS;
end
else if (address_virtual <= STACK_ADDRESS && address_virtual < MMIO_ADDRESS) begin
 // Acceso al bloque .stack
 block_select = 2'b01;
 address_phisical = STACK_ADDRESS - address_virtual;
end
else if (address_virtual >= MMIO_ADDRESS && address_virtual < MMIO_ADDRESS + BLOCK_SIZE) begin
 // Acceso al bloque .MMIO
 block_select = 2'b10;
 address_phisical = address_virtual - MMIO_ADDRESS;
 end
end
endmodule */
module MMU(
 input wire [15:0] address_virtual,
 output reg [1:0] block_select,
 output reg [15:0] address_phisical
);
// Definición de direcciones virtuales
parameter DATA_ADDRESS = 16'h0000;
parameter MMIO_ADDRESS = 16'h0080;
// Definición de tamaño de bloque (32 registros de 32 bits)
parameter BLOCK_SIZE = 32;
// Mapeo de direcciones virtuales a bloques de datos
always @(*) begin
 block_select = 2'b00;
 if (address_virtual >= MMIO_ADDRESS && address_virtual <= MMIO_ADDRESS + 12)
begin
    // Acceso al bloque .MMIO
 block_select = 2'b10;
 address_phisical = address_virtual - MMIO_ADDRESS;
end
else if (address_virtual >= DATA_ADDRESS && address_virtual <MMIO_ADDRESS ) begin
    // Acceso al bloque .data
 block_select = 2'b00;
 address_phisical = address_virtual - DATA_ADDRESS; 
end 
end
endmodule