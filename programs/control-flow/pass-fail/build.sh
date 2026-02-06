#!/usr/bin/env bash
set -e

nasm -f elf32 main.asm -o main.o
ld -m elf_i386 -o main main.o

echo "Built: ./main"
