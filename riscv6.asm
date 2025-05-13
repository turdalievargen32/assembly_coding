.data 
array: .word 1, 2, 3, 4 , 5, 6, 7, 8 ,9, 10
res: .word 0 

.text 
	la x10, array
	li t0, 0
	li t1, 0

loop:	
	lw t2, 0(x10)
	add t1, t1, t2 
	addi x10, x10, 4 
	addi t0, t0, 1 
	
	li t3, 10 
	blt t0, t3, loop
	
	la x11, res 
	sw t1, (x11)
	
	mv a0 ,t1 
	li a7, 1 
	ecall 
	li a7, 10
	ecall 
	


