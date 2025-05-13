.data 
    .word 12     # первое
    .word 25     # второе
    .word 8      # третье
    .word 0      # результат

.text 
    lui s0, 0x10010      # база адреса .data
    lw s1, 0(s0)         # s1 = 12
    lw s2, 4(s0)         # s2 = 25
    lw s3, 8(s0)         # s3 = 8

    # Выбираем максимум из s1 и s2
    blt s1, s2, max_s2
    mv t0, s1            # максимум = s1
    j compare_s3

max_s2:
    mv t0, s2            # максимум = s2

compare_s3:
    blt t0, s3, max_s3
    mv t1, t0            # максимум = t0 (между s1 и s2)
    j result

max_s3:
    mv t1, s3            # максимум = s3

result:
    sw t1, 12(s0)        # сохранить максимум
    mv a0, t1            # подготовить к печати
    li a7, 1
    ecall

    li a7, 10
    ecall
