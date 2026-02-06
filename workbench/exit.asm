; workbench/exit.asm
; Minimal 32-bit NASM program (Linux) — exits cleanly
;
; Build:
;   nasm -f elf32 exit.asm -o exit.o
;   ld -m elf_i386 -o exit exit.o
; Run:
;   ./exit

section .text
    global _start

_start:
    mov eax, 1      ; sys_exit
    xor ebx, ebx    ; exit code 0
    int 0x80
