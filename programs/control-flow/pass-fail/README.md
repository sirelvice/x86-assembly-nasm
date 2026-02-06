# Pass / Fail (x86 NASM)

Checks a score and prints:
- PASS if score >= 40
- FAIL otherwise

## What it teaches
- `cmp` and conditional jumps (`jl`)
- Basic output using `sys_write`
- Exiting with `sys_exit`

## Build (WSL / Linux)
```bash
nasm -f elf32 main.asm -o main.o
ld -m elf_i386 -o main main.o
```

## Run
```bash
./main
```

## Notes
Change the value of `score dd ...` inside `main.asm` to test different outcomes.
