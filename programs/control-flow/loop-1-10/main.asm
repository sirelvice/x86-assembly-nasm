; Program: Loop from 1 to 10 (static output)

section .data
    nums db "1",10,"2",10,"3",10,"4",10,"5",10,"6",10,"7",10,"8",10,"9",10,"10",10
    len equ $ - nums

section .text
    global _start

_start:
    mov eax, 4
    mov ebx, 1
    mov ecx, nums
    mov edx, len
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
