.text
ori s0,zero,10
ori s1,zero,30

	blt s0,t1,verd_1
falso:
	ori t0,zero,0
	j fin
verd_1:
	blt t1,s1,verd_2
	j falso:
verd_2:
	ori t0,zero,1
	j fin
fin:
	ori a1,zero,10
	ecall