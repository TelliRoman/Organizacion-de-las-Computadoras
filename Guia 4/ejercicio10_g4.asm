.data
	V: .word 100,200,150,134,120,1,3,4,5,6,7,8,9,10,125,144,180,170,11,12,13,14,15,16,17,18,19,20,111,112
.text
	la t0,V
	li a0,0
	li a4,0
	li a1,30
	li a2,100
	li a3,200
	
	for: beq a4,a1,fin
	     lw t1,(t0)
	     addi a4,a4,1
	     addi t0,t0,4
	     bge t1,a2,mayor100
	     j for
	     mayor100: ble t1,a3,menor200
	     j for
	     menor200: add a0,a0,t1
	     j for
	fin: ori a7,zero,10
	     ecall