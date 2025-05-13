.data 
z: .word 11 
n: .asciz  "Alessandro!"
w1: .word 2, w5 
w2: .word 8, w4 
w3: .word -22, 0
w4: .word 14, w3 
w5: .word 9, w2 


.text 

lui t0, 0x1001
lw t1, 20(t0)
lw t2, 0(t1)

