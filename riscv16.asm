.data
    x: .word 4, 2, 3, 4, 4, 3, 2
    y: .word -1, -4, -9, 2
    res: .word 0

.text
    la x10, y            # указатель на y
    li t0, 0             # индекс
    lw t3, 0(x10)        # max_y = y[0]

# Найти максимум в y
find_max:
    lw t1, 0(x10)
    blt t3, t1, update_max
    j next_y
update_max:
    mv t3, t1
next_y:
    addi x10, x10, 4
    addi t0, t0, 1
    li t2, 4
    blt t0, t2, find_max

# Проверка x[i] >= max_y
    la x11, x
    li t0, 0
    li a0, 1             # считаем, что условие верно

check_x:
    lw t1, 0(x11)
    blt t1, t3, fail     # если x[i] < max_y → fail
    addi x11, x11, 4
    addi t0, t0, 1
    li t2, 7
    blt t0, t2, check_x
    j done

fail:
    li a0, 0

done:
    la t1, res
    sw a0, 0(t1)
    li a7, 1
    ecall
    li a7, 10
    ecall



# Exercise 1. Let x and y be two arrays of n and m integers in the data segment, print 1 if all the elements of x are
# larger or equal to all the elements of y.
# Example: Let x = [4, 2, 3, 4, 4, 3, 1], n = 7, and y = [−1, −4, −9, 2], m = 4. In this case you should print 1.