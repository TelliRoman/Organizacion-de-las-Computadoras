.data
dato1: .word 87
dato2: .word 13
res: .space 4
mod: .space 4
.text
	lw t1,dato1
	lw t2,dato2
	and a0,zero,zero
	and a1,zero,zero
si:	beq t2,zero,finsi
entonce:div a0,t1,t2
	rem a1,t1,t2
finsi:	sw a0,res,t0
	sw a1,mod,t0
	nop