.data 
	.word 10 
	.word 10 
	.word 0 
	
.text 
	lui x10, 0x10010 
	lw t1, 0(x10)
	lw t2, 4(x10)
	addi a0,zero, 0 
	blt t1, t2, label 
	addi a0, zero, 1 
	
	
label:
	addi a7,zero, 1
	ecall 
	addi a7,zero, 10
	ecall 
	
