# Assembly Language Basics (x86 NASM)

## What is Assembly Language?

Assembly language is a low-level programming language that is very close
to machine code (the binary instructions executed by the CPU).

Instead of high-level constructs like loops and functions, assembly uses
explicit instructions such as:

- `mov` (move data)
- `add` (addition)
- `cmp` (compare)
- `jmp` (jump)

---

## Where Assembly is Used Today

Even though most applications use high-level languages, assembly is still
important in:

- Operating systems and kernels
- Embedded systems and microcontrollers
- Performance-critical code (crypto, codecs)
- Reverse engineering and security research
- Device drivers and hardware interaction

---

## VS Code and Assembly

### Is VS Code an IDE?

VS Code is primarily a code editor, but with extensions and tooling it
behaves like an IDE.

### Can you run Assembly in VS Code?

Yes. VS Code allows you to:

- Write `.asm` files
- Run build commands (`nasm`, `ld`)
- Debug with tools like `gdb`

VS Code itself does not execute assembly — it uses system tools.

---

## Building and Running (Linux / WSL)

```bash
nasm -f elf32 program.asm -o program.o
ld -m elf_i386 program.o -o program
./program