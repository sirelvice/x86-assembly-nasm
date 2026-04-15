; Program: Echo Input (read + print)

section .data
    prompt db "Enter a number: ", 0
    prompt_len equ $ - prompt

    newline db 10

section .bss
    buffer resb 10

section .text
    global _start

_start:
    ; print prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; read input
    mov eax, 3          ; sys_read
    mov ebx, 0          ; stdin
    mov ecx, buffer
    mov edx, 10
    int 0x80

    ; print what user typed
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 10
    int 0x80

    ; newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; exit
    mov eax, 1
    xor ebx, ebx
    int 0x80
