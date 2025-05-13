.data 
array: .word 1,45,3 4,20
res: .word 0 

.text
	la x10, array
	li t0, 0
	li t1, 0
	
loop:
	lw t2, 0(x10)
	blt t1, t2, update_max
	j skip
	
update_max:
	mv t1, t2

skip:	addi x10, x10, 4   # перейти к следующему элементу
	addi t0, t0, 1     # i++
	li t3, 5           # длина массива
	blt t0, t3, loop   # если i < 5 — продолжить

    
    la x11, res
    sw t1, (x11)
    mv a0, t1 
    li a7, 1 
    ecall 
    li a7, 10 
    ecall 
    
    
	
	