# nasm_stuff
nasm
```
nasm -felf64 prog.asm
ld prog.o -o Programname
./Programname
```

### print.asm
```
%macro print_txt 2
	mov	rax, 1		;system call number (sys_write)
	mov	rdi, 1		;file descriptor (stdout)
	mov	rsi, %1		;message to write
	mov	rdx, %2		;message length
	syscall
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
	mov	rax, 60		;sys_exit
	mov	rdi,0		;EXIT_SUCCESS
	syscall
```


### readprint.asm
```
%macro print_txt 2
	mov	rax, 1		;system call number (sys_write)
	mov	rdi, 1		;file descriptor (stdout)
	mov	rsi, %1		;message to write
	mov	rdx, %2		;message length
	syscall
%endmacro
%macro read_txt 2
	mov	rax, 0		; system call number (sys_read)
	mov	rdi, 0		; standard input
	mov	rsi, text2	
	mov	rdx, len2	
	syscall
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
	mov	rax, 60		;sys_exit
	mov	rdi,0		;EXIT_SUCCESS
	syscall
```
### write file
```
section .data
	filename db "lel.txt",0
	text db "lul"
	textlen equ $ - text

section .text
	global _start

_start:

	; open file
	mov rax, 2		;SYS_OPEN
	mov rdi, filename       ;
	mov rsi, 65             ;CREAT=64, write_only=1, read_only=0
	mov rdx, 0666o          ;permission
	syscall

	; write file
	push rax
	mov rdi, rax
	mov rax, 1              ;SYS_WRITE
	mov rsi, text           ;String to write
	mov rdx, textlen        ;length of the String
	syscall

	; close file
	mov rax, 3              ;SYS_CLOSE
	pop rdi
	syscall

	; exit
	mov rdi,0
	mov rax, 60
	syscall

```



