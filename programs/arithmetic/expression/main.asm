; Program: Arithmetic Expression
;
; Computes:
;   A = B + C - (E * D)
;
; Concepts:
; - mov, add, sub, imul
; - register usage
; - order of operations

; Program: Arithmetic Expression
;
; Computes:
;   A = B + C - (E * D)

; Program: Arithmetic Expression (with output)

section .data
    B dd 5
    C dd 3
    D dd 2
    E dd 4

    result dd 0

    msg db "Result = 0", 10
    len equ $ - msg

section .text
    global _start

_start:
    ; eax = B
    mov eax, [B]

    ; eax = B + C
    add eax, [C]

    ; ebx = E
    mov ebx, [E]

    ; ebx = E * D
    imul ebx, [D]

    ; eax = (B + C) - (E * D)
    sub eax, ebx

    ; store result
    mov [result], eax

    ; print message (static for now)
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 0x80

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80