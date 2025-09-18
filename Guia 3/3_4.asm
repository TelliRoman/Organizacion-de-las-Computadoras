.data
dato1: .word 20
dato2: .word 10
res: .space 4

.text
	lw s8,dato1
	lw s9,dato2
	and t0,t0,zero
	and t1,t1,zero
	bge s8,s9,salto
	ori t1,t1,1
salto:	or t0,t0,t1
	sw t0,res,t6
	nop
	nop