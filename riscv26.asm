# Let l be a list of integers in the data segment. Write a Risc-V
# program, both the data and the text segment, that prints the sum of the positive integers in the list.
# Example: Let l = (4, −2, 3, 4, −4, 3, 1) be the list, the number to print is 15


.data 
list:	.word node0

node0:	.word 4, node1
node1:	.word -2, node2
node2:	.word 3, node3
node3:	.word 4, node4 
node4:	.word -4, node5
node5:	.word 3, node6
node6:	.word 1, 0 

res:	.word 0 

.text	
	lw t0, list 
	li a0, 0 
	
loop:
	beq t0, zero, end      # если список закончился

	lw t1, 0(t0)           # t1 = значение текущего узла
	ble t1, zero, skip     # если отрицательное или ноль → пропускаем

	add a0, a0, t1         # иначе добавляем к сумме

skip:
	lw t0, 4(t0)           # t0 = адрес следующего узла
	j loop                 # повторяем

end:
	la t3, res 
	sw a0, 0(t3)

	li a7, 1 
	ecall 
	li a7, 10 
	ecall 
