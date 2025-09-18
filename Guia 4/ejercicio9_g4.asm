.data
	V: .word 401,402,3,4,5,6,7,408,9,410,11,12,13,14,15,416,417,18,419,420
.text
	la t0,V
	li a0,0
	li a1,0
	li a2,20
	li a3,400
	
	for: beq a1,a2,fin
	     lw t1,(t0)
	     addi t0,t0,4
	     addi a1,a1,1
	     bgt t1,a3,mayor
	     j for
	     mayor: addi a0,a0,1
	     j for
	fin: ori a7,zero,10
	     ecall
	