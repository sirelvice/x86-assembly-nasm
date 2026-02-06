; workbench/pass_fail.asm
; Goal: Determine PASS or FAIL for a score (PASS if score >= 40)
; Teaches: cmp, conditional jumps, sys_write, sys_exit
;
; Build:
;   nasm -f elf32 pass_fail.asm -o pass_fail.o
;   ld -m elf_i386 -o pass_fail pass_fail.o
; Run:
;   ./pass_fail

section .data
    score     dd 55

    pass_msg  db "PASS", 10
    pass_len  equ $ - pass_msg

    fail_msg  db "FAIL", 10
    fail_len  equ $ - fail_msg

section .text
    global _start

_start:
    mov eax, [score]
    cmp eax, 40
    jl  print_fail

print_pass:
    mov eax, 4
    mov ebx, 1
    mov ecx, pass_msg
    mov edx, pass_len
    int 0x80
    jmp exit_program

print_fail:
    mov eax, 4
    mov ebx, 1
    mov ecx, fail_msg
    mov edx, fail_len
    int 0x80

exit_program:
    mov eax, 1
    xor ebx, ebx
    int 0x80
