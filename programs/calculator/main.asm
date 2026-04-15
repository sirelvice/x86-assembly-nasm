; Program: Mini Calculator (add, sub, mul, div)

section .data
    a dd 20
    b dd 4

    op db '+'      ; change: +, -, *, /

    msg db "Result = ", 0
    newline db 10

section .bss
    buffer resb 10

section .text
    global _start

_start:
    mov eax, [a]
    mov ebx, [b]

    mov cl, [op]

    cmp cl, '+'
    je do_add

    cmp cl, '-'
    je do_sub

    cmp cl, '*'
    je do_mul

    cmp cl, '/'
    je do_div

    jmp exit_program

do_add:
    add eax, ebx
    jmp print_result

do_sub:
    sub eax, ebx
    jmp print_result

do_mul:
    imul eax, ebx
    jmp print_result

do_div:
    cdq
    idiv ebx
    jmp print_result

; ===== PRINT RESULT (multi-digit) =====
print_result:
    mov esi, buffer
    mov edi, 0

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
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

exit_program:
    mov eax, 1
    xor ebx, ebx
    int 0x80
