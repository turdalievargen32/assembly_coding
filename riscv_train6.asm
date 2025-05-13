
.data 
len:	.word 8 
arr: .word 4, -1, 0, 7, 8, -6, 2, 5 
res: .word 0 

.text 
	lw t0, len 
	la t1, arr 
	li a0, 0 
	
loop:
	beq t0, zero, end 
	lw t2, 0(t1)
	ble t2, zero, skip
	andi t3, t1, 1 
	bne t2, zero, skip 
	
	j next 
skip:
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