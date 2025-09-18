.data
	V: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
	A: .space 60
.text
	la t0,V
	la t2,A
	li a0,0
	li a1,15
	 
	for: beq a0,a1,fin
	     lw t1,(t0)
	     sw t1,(t2)
	     addi a0,a0,1
	     addi t0,t0,4
	     addi t2,t2,4
	     j for
	fin: 
	    ori a7,zero,10
	     ecall