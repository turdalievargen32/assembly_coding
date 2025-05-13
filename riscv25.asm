Exercise 1.
#Let v be an array of n integers in the data segment, and x an
#integer. Write a Risc-V program, both data and text segment, that
#prints 1 if all the integers in v are smaller than x, 0 otherwise.

.data 

len:	.word 7 
arr:	.word 1,2,3, 4,5 ,6,6
w:	.word 5 
res:	.word 0 


.text
	lw t0, len 
	la t1, arr 
	lw s0, w 
	li a0, 1 
	
loop:	
	lw t2, 0(t1)
	blt t2, s0, end 
	li a0, 0 
	j print 
	
end:
	addi t0, t0, -1 
	addi t1, t1, 4 
	bgt t0, zero, loop
	
print:
	la t4, res
	sw a0, 0(t4)
	li a7, 1 
	ecall 
	li a7,10 
	ecall 