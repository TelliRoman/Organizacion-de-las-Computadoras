.text
ori t1,zero,0x00000001
ori t2,zero,0x00000002
ori t3,zero,0x00000003

bne t1,t2,verdadero
bne t1,t3,verdadero
ori t0,zero,0
j fin
verdadero:
ori t0,zero,1
fin:
ori a7,x0,10
ecall
