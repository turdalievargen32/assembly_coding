.data 
len: .word 7                       # длина массива
array: .word 4, -2, 3, 4, 4, 3, 1    # массив
word: .word 5                       # значение для сравнения
res: .word 0                     # результат (1 или 0)

.text
    # загрузить len и word
    la t0, len
    lw t1, 0(t0)         # t1 = len (размер массива)

    la t2, word
    lw t3, 0(t2)         # t3 = word

    la t4, array            # t4 = указатель на v[0]
    li t5, 0             # t5 = индекс i

    li a0, 1             # предполагаем, что всё условие true

loop:
    bge t5, t1, done     # если i >= n → конец

    lw t6, 0(t4)         # t6 = array[i]

    ### ВАЖНО: вот здесь вставляется проверка
    ### например, если array[i] >= word → условие нарушено
    bge t6, t3, fail

    # обновляем указатель и индекс
    addi t4, t4, 4       # t4 = t4 + 4 (следующий элемент)
    addi t5, t5, 1       # t5++
    j loop

fail:
    li a0, 0             # нашли нарушение → ответ 0

done:
    la t6, res
    sw a0, 0(t6)         # сохранить результат
    li a7, 1
    ecall                # вывести результат
    li a7, 10
    ecall                # завершить программу
    
    
    
# Exercise 1. Let v be an array of n integers in the data segment, and x an integer. Write a Risc-V program, both
# data and text segment, that prints 1 if all the integers in v are smaller than x, 0 otherwise.
# Exemple: Let v = [4, −2, 3, 4, 4, 3, 1], n = 7, x = 5. The number to print is 1.
