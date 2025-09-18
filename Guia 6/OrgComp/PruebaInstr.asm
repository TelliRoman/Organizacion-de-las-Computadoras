.text
	li t0,0
	li t1,3
	li t3,516
	while: beq t0,t1,fin
		addi t0,t0,1
		j while
	fin:
		sw t0,0(t3)
		lw t2,0(t3)
		
