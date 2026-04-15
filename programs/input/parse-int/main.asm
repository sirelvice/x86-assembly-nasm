; Program: Convert input string to integer

section .data
    prompt db "Enter a number: ", 0
    prompt_len equ $ - prompt

    msg db "Parsed = ", 0
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
    mov eax, 3
    mov ebx, 0
    mov ecx, buffer
    mov edx, 10
    int 0x80

    ; convert string → integer
    mov esi, buffer
    xor eax, eax        ; result = 0

convert_loop:
    mov bl, [esi]

    cmp bl, 10          ; newline?
    je done_convert

    sub bl, '0'         ; ASCII → number

    imul eax, eax, 10
    add eax, ebx

    inc esi
    jmp convert_loop

done_convert:

    ; ===== print result (reuse your logic) =====
    mov esi, buffer
    mov edi, 0

convert_back:
    mov edx, 0
    mov ebx, 10
    div ebx

    add dl, '0'
    mov [esi], dl

    inc esi
    inc edi

    cmp eax, 0
    jne convert_back

    ; print "Parsed = "
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
