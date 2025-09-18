.text
li t1,0x00000002
li t2,0x00000002

# a)
	blt t1,t2,true
false:
	li t0,0
	j fin
true:
	li t0,1
	j fin
fin:
	ori a7,x0,10
	ecall