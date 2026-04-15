; Program: Compare Two Integers
;
; Description:
; Compares two integer values.
; - If equal → prints "EQUAL"
; - If not equal → determines the larger value
; - Computes the difference between them
;
; Concepts:
; - cmp instruction
; - conditional jumps (je, jg, jl)
; - arithmetic (sub)
; - memory storage
;
; Build:
;   nasm -f elf32 main.asm -o main.o
;   ld -m elf_i386 -o main main.o
;
; Run:
;   ./main



section .data
    a dd 12
    b dd 20

    equal_msg db "EQUAL", 10
    equal_len equ $ - equal_msg

    a_larger_msg db "A is larger", 10
    a_larger_len equ $ - a_larger_msg

    b_larger_msg db "B is larger", 10
    b_larger_len equ $ - b_larger_msg

section .bss
    diff resd 1

section .text
    global _start

_start:
    mov eax, [a]
    mov ebx, [b]

    cmp eax, ebx
    je equal_case
    jg a_larger
    jl b_larger

equal_case:
    mov eax, 4
    mov ebx, 1
    mov ecx, equal_msg
    mov edx, equal_len
    int 0x80
    jmp exit_program

a_larger:
    mov eax, [a]
    sub eax, [b]
    mov [diff], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, a_larger_msg
    mov edx, a_larger_len
    int 0x80
    jmp exit_program

b_larger:
    mov eax, [b]
    sub eax, [a]
    mov [diff], eax

    mov eax, 4
    mov ebx, 1
    mov ecx, b_larger_msg
    mov edx, b_larger_len
    int 0x80

exit_program:
    mov eax, 1
    xor ebx, ebx
    int 0x80