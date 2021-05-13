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
	mov	rdx, %2		;maxBytesToPrint
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
	mov	rax, 1		;sys_exit
	mov	rbx,0
	int	0x80
```


### readprint.asm
```
%macro print_txt 2
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, %1
	mov	rdx, %2		;maxBytesToPrint
	int	80h
%endmacro
%macro read_txt 2
	mov	rax, 0x3
	mov	rbx, 0x1
	mov	rcx, %1
	mov	rdx, %2		;maxBytesToRead
	int	80h
%endmacro

section .data

	text1 db "your text:", 10
	len_text1 equ $ - text1
	
	text2 times 255 db 0
	len_text2 equ $ - text2
	
section .text
	global _start
	
_start:
	print_txt text, len
	read_txt text2, len_text2
	print_txt text2, len_text2
	jmp _exit
  
_exit:
	mov rax, 1		;sys_exit
	mov rbx, 0
	int 0x80	
```




