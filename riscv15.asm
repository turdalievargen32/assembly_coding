.data
node1:  .word 8
        .word node2

node2:  .word 5
        .word node3

node3:  .word -6
        .word node4

node4:  .word -1
        .word 0

res:    .word 0


.text 
	la x10, node1 
	li t1, 0 
	
loop:	
	beq x10, zero, end 
	lw t2, 0(x10)
	bge t2, zero, skip 
	mv t1, t2 
	j end 


skip:
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