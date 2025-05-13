#Let v be an array of integers in the data segment, and x and y two
#integers. Write a Risc-V program, both data and text segment, that
#counts the number of elements of the array that are equal to x or equal to y and prints the result.


# Let v = [4, −2, 3, 4, 4, 3, 1], n = 7, x = 4 and y = 3. The number to print is 5.


.data 

len:	.word 7 
arr:	.word 4, -2, 3, 4, 4, 3, 1 
x:	.word 4 
y:	.word 3 
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
	addi t0, t0, -1 
	addi t1, t1, 4 
	j loop
	
end:	
	la t4, res 
	sw a0, 0(t4)
	li a7, 1 
	ecall 
	li a7, 10 
	ecall 
	

	
	
		