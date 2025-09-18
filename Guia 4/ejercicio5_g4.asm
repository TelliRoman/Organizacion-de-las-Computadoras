.data
	V: .word 5,5,4
.text
	la t0,V
	la t2,V
	li a0,0
	li a2,0
	li a1,3
	for1:beq a0,a1,fin
	    lw t1,(t0)
	    for2: beq a2,a1,fin
	    	  lw t3,(t2)
	    	  blt t3,t1,break
	    	  addi t2,t2,4
	    	  addi a2,a2,1
	    	  j for2
	   break: la t2,V
	          addi t0,t0,4
	   	  li a2,0
	   	  addi a0,a0,1
	   	  j for1
	   fin:la t0,V
	       sw t1,12(t0)
	       ori a7,zero,10
	       ecall

	     