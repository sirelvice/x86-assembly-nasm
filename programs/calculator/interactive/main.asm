; Program: Interactive Calculator

section .data
    prompt1 db "Enter first number: ", 0
    p1_len equ $ - prompt1

    prompt2 db "Enter second number: ", 0
    p2_len equ $ - prompt2

    prompt_op db "Enter operator (+ - * /): ", 0
    op_len equ $ - prompt_op

    msg db "Result = ", 0
    newline db 10

section .bss
    buf1 resb 10
    buf2 resb 10
    op   resb 2
    buffer resb 10

section .text
    global _start

_start:

; ---- input a ----
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt1
    mov edx, p1_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, buf1
    mov edx, 10
    int 0x80

; convert buf1 → eax
    mov esi, buf1
    xor eax, eax

conv1:
    mov bl, [esi]
    cmp bl, 10
    je done1
    sub bl, '0'
    imul eax, eax, 10
    add eax, ebx
    inc esi
    jmp conv1

done1:
    mov edi, eax   ; store a

; ---- input b ----
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt2
    mov edx, p2_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, buf2
    mov edx, 10
    int 0x80

; convert buf2 → eax
    mov esi, buf2
    xor eax, eax

conv2:
    mov bl, [esi]
    cmp bl, 10
    je done2
    sub bl, '0'
    imul eax, eax, 10
    add eax, ebx
    inc esi
    jmp conv2

done2:
    mov ebx, eax   ; store b

; ---- input operator ----
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt_op
    mov edx, op_len
    int 0x80

    mov eax, 3
    mov ebx, 0
    mov ecx, op
    mov edx, 2
    int 0x80

    mov dl, [op]

; ---- operation ----
    mov eax, edi   ; a

    cmp dl, '+'
    je add_op

    cmp dl, '-'
    je sub_op

    cmp dl, '*'
    je mul_op

    cmp dl, '/'
    je div_op

add_op:
    add eax, ebx
    jmp print

sub_op:
    sub eax, ebx
    jmp print

mul_op:
    imul eax, ebx
    jmp print

div_op:
    cdq
    idiv ebx
    jmp print

; ---- print result ----
print:
    mov esi, buffer
    mov edi, 0

convert:
    mov edx, 0
    mov ecx, 10
    div ecx

    add dl, '0'
    mov [esi], dl

    inc esi
    inc edi

    cmp eax, 0
    jne convert

    ; print "Result = "
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 9
    int 0x80

print_loop:
    cmp edi, 0
    je done

    dec esi
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    mov edx, 1
    int 0x80

    dec edi
    jmp print_loop

done:
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    mov eax, 1
    xor ebx, ebx
    int 0x80
