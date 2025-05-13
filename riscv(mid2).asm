.data
    .align 2              # Aligns the following data to a word boundary
    value: .word 52
    length: .word 5       # Length of the array
    array: .word 4, -12, 0, 52, 8 # Array
    msg_found: .asciiz "Trovato."
    msg_not_found: .asciiz "Non trovato"

.text
    .globl main
main:
    la t0, value          # Load address of 'value' into t0
    lw t0, 0(t0)          # Load the value at 'value' into t0
    la t1, length         # Load address of 'length' into t1
    lw t1, 0(t1)          # Load the length into t1
    la t2, array          # Load address of 'array' into t2


ciclo:
    lw t3, 0(t2)          # loads 1st el. of array
    bne t3, t0, salta     # if value != 52, salta
    beq zero, zero, trovato  # go to "trovato"

salta:
    addi t2, t2, 4        # increment address of 4
    addi t1, t1, -1       # decrement length array
    bne t1, zero, ciclo   # if len(array) != 0, ciclo
    addi a0, s0, 0x24       # take address of "Non Trovato"
    li a7, 4
    ecall                 # print string

    li a7, 10
    ecall                 # exit

trovato:
    addi a0, s0, 0x1c       # take address of "Trovato"
    li a7, 4
    ecall                 # print str

    li a7, 10
    ecall                 # exit
