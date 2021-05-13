global start


section .data
	text db "your text", 10
	len equ $ - text
	
section .text
start:
	call _print
	call _exit



_print:
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, text
	mov	rdx, len
	int	80h
	jmp _exit
	ret
	
_exit:
	mov rax, 1	;sys_exit
	mov rbx,0
	int 0x80
