; Program: Integer Division (a / b)
;
; Computes:
;   result = a / b
;
; Concepts:
; - idiv instruction
; - use of EAX and EDX
; - quotient stored in EAX

section .data
    a dd 20
    b dd 4

    msg db "Result = ", 0
    newline db 10

section .bss
    digit resb 1

section .text
    global _start

_start:
    ; eax = a
    mov eax, [a]

    ; prepare for division (very important)
    cdq                ; sign-extend eax into edx

    ; divide eax by b
    idiv dword [b]     ; eax = eax / b

    ; convert result (0–9 only)
    add eax, '0'
    mov [digit], al

    ; print "Result = "
    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, 9
    int 0x80

    ; print digit
    mov eax, 4
    mov ebx, 1
    mov ecx, digit
    mov edx, 1
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
