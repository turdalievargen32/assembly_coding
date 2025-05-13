.data
node1:  .word 4
        .word node2

node2:  .word 10
        .word node3

node3:  .word 6
        .word 0      # конец списка

res:    .word 0

.text 
	la x10, node1 
	li t1, 0 
	
loop:
	beq x10, zero, end
	lw t2, 0(x10)
	add t1, t1, t2 
	lw x10, 4(x10)
	j loop 
	
end:
	
	la x11, res 
	sw t1, 0(x11)
	mv a0, t1 
	
	li a7, 1
	ecall 
	li a7, 10 
	ecall  
	


