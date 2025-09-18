.data
mul_a: .word 3

.text
lw a0,mul_a
slli t0,a0,3
slli t1,a0,4
add a1,t0,t1