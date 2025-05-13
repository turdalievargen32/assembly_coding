.data 

node1: .word -3
	.word node2 

node2:	.word 2 
	.word node3 
	
node3:	.word -4 
	.word node4 
	
node4:	.word -1 
	.word node5
	
node5:	.word 32 
	.word 0 
	
res:	.word 0 

.text	
	la x10, node1
	li t1, 0 
	
loop:	
	beq x10, zero, end 
	lw t2, 0(x10)
	
	blt t2, zero, count_neg
	j skip 
	
count_neg:
	addi t1, t1, 1 
	
	
skip:
	lw x10, 4(x10)
	
	j loop
	
end:	la x11, res 
	sw t1, 0(x11)
	mv a0, t1 
	li a7, 1 
	ecall 
	li a7, 10 
	ecall 
	