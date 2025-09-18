.text
	li a0,21
	li a1,2
	li a2,0
	
	rem t1,a0,a1
	beq t1,a2,par
	
	impar: li s1,20
	j fin
	
	par: li s1,10
	
	fin:
	ori a7,zero,10
	ecall
	
	
	