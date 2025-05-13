.data 
n: .word 7                       # длина массива
v: .word 4, -2, 3, 4, 4, 3, 1    # массив
x: .word 5                       # значение для сравнения
res: .word 0                     # результат (1 или 0)


.text 

	la t0, n 
	lw t1, 0(t0)
	
	la t2, x 
	lw t3, 0(t2)
	
	la t4, v 
	li t5, 0
	
	li a0, 1 
	
loop:
	bge t5, t1, end 
	lw t6, 0(t4)
	
	bge t6, t1, fail 
	
	addi t4, t4, 4 
	addi t5, t5, 1 
	j loop
	
fail:	
	li a0, 0 
	
end:
	la t6, res 
	sw a0, 0(t6)
	li a7, 1 
	ecall 
	li a7, 10 
	ecall 
	
	
	