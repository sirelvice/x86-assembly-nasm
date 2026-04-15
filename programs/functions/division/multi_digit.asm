; Program: Division with multi-digit output

section .data
    a dd 123
    b dd 1

    msg db "Result = ", 0
    newline db 10

section .bss
    buffer resb 10

section .text
    global _start

_start:
    mov eax, [a]

    cdq
    idiv dword [b]

    mov esi, buffer
    mov edi, 0          ; digit count

convert_loop:
    mov edx, 0
    mov ebx, 10
    div ebx

    add dl, '0'
    mov [esi], dl

    inc esi
    inc edi

    cmp eax, 0
    jne convert_loop

    ; print "Result = "
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 9
    int 0x80

print_loop:
    cmp edi, 0
    je done_print

    dec esi
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    mov edx, 1
    int 0x80

    dec edi
    jmp print_loop

done_print:
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