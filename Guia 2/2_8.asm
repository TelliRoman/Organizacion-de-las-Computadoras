.data
	a: .word 1
	b: .word 2
	c: .word 3
	d: .word 4
	e: .word 5
	
.text

lw a1,a
lw a2,b
lw a3,c
lw a4,d
lw a5,e

# n)
add t1,a2,a3
div t2,a4,a5
mul t1,t1,t2
sw t1,a,t2

# m)
mul t1,a2,a3
mul t1,t1,a4
sw t1,a,t2

# l)
sub t1,a2,a3
sub t2,a4,a5
mul t1,t1,t2
sw t1,a,t2

# k)
li t0,3
mul t1,t0,a5
sw t1,a,t2

# j)
div t1,a2,a3
sw t1,a,t2

# i)
mul t1,a2,a3
sw t1,a,t2

# h)
add t1,a2,a3
add t2,a4,a5
sub t1,t1,t2
sw t1,a,t2

# g)
sub t1,a2,a4
add t1,t1,a3
sw t1,a,t2

# f)
sub t1,a2,a3
sw t1,a,t2

# e)
add t1,a2,a3
add t1,t1,a4
add t1,t1,a5,
sw t1,a,t2

# d)
addi t1,a3,2
sw t1,a,t2

# c)
addi t1,a1,1
sw t1,a,t2

# b)
add t1,a2,a3
sw t1,a,t2

# a)
sw a2,a,t2

