.data
	palabra: .asciz "BUENOSANTIiii"
.text 
	lb a0,palabra #El primer char de la palabra
	la a1,palabra #La direccion a el primer char de la palabra
	jal ContString
	li a7,10
	ecall
	ContString:
		addi t0,t0,0 #contador de char
		bucle:	beqz a0,fin 
			addi t0,t0,1 #Incremento contador
			addi a1,a1,1 #Me muevo un byte
			lb a0,(a1)   #Me guardo el char del byte que me movi	
			j bucle
		fin:	
			addi a0,t0,0
			jr ra 
			
