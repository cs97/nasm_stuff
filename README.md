# nasm_stuff
nasm

nasm -felf64 prog.asm
ld prog.o
./a.out


### print.asm
```
%macro print_txt 2
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, %1
	mov	rdx, %2
	int	80h
%endmacro

section .data
	text db "your text", 10
	len equ $ - text
  
section .text
	global _start

_start:
  print_txt text, len
  jmp _exit
  
_exit:
	mov rax, 1	;sys_exit
	mov rbx,0
	int 0x80
```
