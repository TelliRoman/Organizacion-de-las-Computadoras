.text
li t1,0x00000001
li t2,0x00000001

# a)
	bne t1,t2,true_bne
	j true
true_bne:
	blt t2,t1,true
	li t0,0
	j fin
true:
	li t0,1
	j fin
fin:
	ecall