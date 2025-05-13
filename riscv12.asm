.data 
node1:  .word 10 
	.word node2 

node2: 	.word 11
	.word node3

node3:	.word 24 
	.word 0
	
res: 	.word 0 

.text
	la x10, node1 
	lw t1, 0(x10)
	
loop:	
	beq x10, zero, end
	lw t2, 0(x10)
	blt t1, t2, update_max
	j skip

update_max:
	mv t1, t2 
	
skip:	
	lw x10, 4(x10)
	j loop
	
end:	
	la x11, res 
	sw t1, 	 0(x11)
	mv a0, t1 
	
	li a7, 1 
	ecall 
	li a7, 10 
	ecall 
	
