.data
	V: .space 16
	n: .word 10
	total: .word
.text
	la t0,V
	la t1,n
	la t2,total
	li a0,0
	li a2,2
	li a3,1
	lw a1,(t1)
	#inicializacion
	for: beq a0,a1,fin
	     rem t3,a0,a2
	     addi a0,a0,1
	     beq t3,zero,asigna0 #pone al elemento n del vector en 0 si el contador es par, si el contador es impar lo pone en 1
	     sw a3,(t0)
	     addi t0,t0,4
	     j for
	     asigna0: sw zero,(t0)
	     addi t0,t0,4
	     j for
	fin: 
	#ver cuantos elementos son igual a 0
	la t0,V
	li a4,0 #contador de 0
	li a0,0
	for2: beq a0,a1,fin2
	      lw  t3,(t0)
	      addi a0,a0,1
	      addi t0,t0,4
	      beq t3,zero,igual0
	      j for2
	      igual0:addi a4,a4,1
	      j for2
	fin2: sw a4,(t2)
	     ori a7,zero,10
	     ecall
	      
	
	
	
	
