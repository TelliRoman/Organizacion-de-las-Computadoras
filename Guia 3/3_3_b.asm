.text
ori t1,zero,0x00000001
ori t2,zero,0x00000002
ori t3,zero,0x00000003

ori s0,zero,5

bne t1,s0,falso
bne t2,t3,falso
ori t0,zero,1
j fin
falso:
ori t0,zero,0
fin:
ori a7,x0,10
ecall
