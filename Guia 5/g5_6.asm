.data 
    V: .word 100,200,300,400,500,600,700,800,900,1000
    A: .word 40   #4 bytes por 15 variables = 60 bytes
.text
	la t1,V #Me guardo la direc del vector V
	addi t2,t2,0
	addi t3,t3,10
	for: beq t2,t3,fin
		lw a1,(t1) #Leo el  valor del vector
		addi sp,sp,-4
		sw a1,(sp) #Guardo el  valor del vector en la pila
		addi t1,t1,4
		addi t2,t2,1
		j for
	fin:	 
	     addi t2,t2,0
	     addi t3,t3,10
	     la t1,V #Me guardo la direc del vector V
	     for2: beq t2,t3,fin2
	     		lw a2,(sp) #Leo el valor acumulado en la pila	
	     		sw a2,(t1) #Guardo lo que estaba en la pila en V
	     		addi sp,sp,4
	     		addi t1,t1,4
	     		addi t2,t2,1
			j for2
	     fin2:
	     		li a7,10
			ecall	
