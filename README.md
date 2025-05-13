# 🧠 Assembly Coding Practice

This repository contains solutions to various exercises written in **Assembly language**.  
These tasks were completed as part of my personal practice to strengthen my understanding of low-level programming and computer architecture.

---

## 📚 Topics Covered

- Basic syntax and structure of Assembly
- Working with registers and memory
- Arithmetic and logical operations
- Loops and conditions
- System calls and basic input/output
- Stack manipulation

---

## ⚙️ Technologies

- NASM (Netwide Assembler)(RISC-V) 
- Linux terminal
- `gcc` for linking
- `gdb` for debugging

---

## 🚀 How to Run

To assemble and run a file (example: `task1.asm`):

```bash
nasm -f elf64 task1.asm -o task1.o
ld task1.o -o task1
./task1

