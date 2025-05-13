.data

node1:	.word 10 
	.word node2

node2:
	.word 5 
	.word node3
	
node3:	.word 4 
	.word node4 
	
node4:	.word 1 
	.word 0 
	
res:	.word 0 


.text 
	
		
	la x10, node1 
	li t1, 0	
loop:
	beq x10, zero, end
	lw t2, 0(x10)
	andi t3, t2, 1 
	bne t3, zero, skip 
	
	add t1, t1, t2 
	
skip:
	lw x10, 4(x10)
	j loop
	
end:	
	la x11, res 
	sw t1, (x11)
	mv a0 ,t1 
	li a7, 1 
	ecall 
	li a7, 10 
	ecall 
	
	

	
	 