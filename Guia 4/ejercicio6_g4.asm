.data
	V: .word 1,2,3,4,5,6,7,8,9,10
.text
	la t0,V
	li a0,0
	li a1,10
	li a2,8
	for: beq a0,a1,fin
	     lw t1,(t0)
	     mul t1,t1,a2
	     sw t1,(t0)
	     addi t0,t0,4
	     addi a0,a0,1
	     j for
	fin: ori a7,zero,10
	     ecall