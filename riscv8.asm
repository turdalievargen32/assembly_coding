.data
array: .word 1, 2, 3, 4, 5
res:   .word 0

.text
    la x10, array       # x10 = указатель на массив
    li t0, 0            # i = 0
    li t1, 0            # count = 0
    li t4, 3            # порог сравнения = 3

loop:
    lw t2, 0(x10)       # t2 = array[i]
    blt t2, t4, skip    # если array[i] < 3 → пропускаем

    addi t1, t1, 1      # иначе: count++

skip:
    addi x10, x10, 4    # перейти к array[i+1]
    addi t0, t0, 1      # i++
    li t3, 5
    blt t0, t3, loop    # пока i < 5

    # сохранить и вывести результат
    la x11, res
    sw t1, 0(x11)

    mv a0, t1
    li a7, 1
    ecall

    li a7, 10
    ecall
