.data
	V: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15
	A: .space 60
.text
	la t0,V
	la t2,A
	li a0,0
	li a1,15
	li a2,2
	 
	for: beq a0,a1,fin
	     lw t1,(t0)
	     addi t0,t0,4
	     addi a0,a0,1
	     rem t3,t1,a2 #si el numero es par t3 va a ser 0 si no va a ser distinto de 0
	     beq t3,zero,for  #si el numero es par me voy a for si no sigo
	     sw t1,(t2)
	     addi t2,t2,4
	     j for
	fin: 
	    ori a7,zero,10
	     ecall
