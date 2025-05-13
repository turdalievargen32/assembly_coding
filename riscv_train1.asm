.data 
len:	.word 7 
arr:	.word 0, 0, 0, 0, 0, 1, 2 
x:	.word 0 
y:	.word 2 
res:	.word 0 


.text 

	lw t0, len 
	la t1, arr 
	lw s0, x 
	lw s1, y 
	li a0, 0 
	
loop:
	beq t0, zero, end 
	lw t2, 0(t1)
	beq t2, s0, count 
	beq t2, s1, count 
	
	j next 
	
count:	
	addi a0, a0, 1 
	
next:	
	addi t1, t1, 4 
	addi t0, t0, -1 
	j loop
	
end:	
	la t4, res 
	sw a0, 0(t4)
	
	li a7, 1 
	ecall 
	li a7, 10
	ecall 
	
 