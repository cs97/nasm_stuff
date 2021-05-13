
; macro
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

	call _print
	print_txt text, len
	call _exit

_print:
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, text
	mov	rdx, len
	int	80h
	ret
	
_exit:
	mov rax, 1	;sys_exit
	mov rbx,0
	int 0x80
