.data
    .word 15        # первое число
    .word 27        # второе число
    .word 0         # сюда сохраним максимум

.text
    lui x10, 0x10010
    lw t1, 0(x10)       # t1 = 15
    lw t2, 4(x10)       # t2 = 27

    blt t1, t2, use_t2  # если t1 < t2, прыгай к use_t2
    mv t3, t1           # иначе максимум = t1
    j store_result

use_t2:
    mv t3, t2           # максимум = t2

store_result:
    sw t3, 8(x10)       # сохраняем максимум
    mv a0, t3
    li a7, 1
    ecall

    li a7, 10
    ecall
