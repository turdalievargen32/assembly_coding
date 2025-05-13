.data
array: .word 0, 1,-4,-3,5,6
res:	.word 0

 .text
 	la x10, array 
 	li t0, 0 
 	li t1, 0 
 	li t4, 0
 	
loop:
	lw t2, 0(x10)
	bge t2, zero, skip 
	addi t1, t1, 1 
	
skip:
	addi x10, x10, 4 
	addi t0, t0 ,1 
	li t3, 6 
	blt t0, t3, loop
	
	la x11, res 
	sw t1, 0(x11)
	mv a0, t1 
	
	li a7, 1 
	ecall 
	li a7, 10 
	ecall 
	
	
	

