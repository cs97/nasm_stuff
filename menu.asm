
section .data

	txt1 db "text1", 0x0a
	len1 equ $ - txt1

	txt2 db "text2", 0x0a
	len2 equ $ - txt2

	txt3 db "text3", 0x0a
	len3 equ $ - txt3

	logo1 db "==============================================", 0x0a
	logo2 db "|| nasm menu efl64                          ||", 0x0a
	logo3 db "==============================================", 0x0a
	logo4 db "|| 1. text1                                 ||", 0x0a
	logo5 db "|| 2. text2                                 ||", 0x0a
	logo6 db "|| 3. text3                                 ||", 0x0a
	logo7 db "||                                          ||", 0x0a
	logo8 db "|| 0. exit                                  ||", 0x0a
	logo9 db "==============================================", 0x0a
	logolen equ $ - logo1
	len equ $ - logo9

section .bss
	input resd 2

section .text
	global start
start:
	call _menu
	jmp _exit

_menu:
	mov rax, len
    mov rdx, 9
    mul rdx
	mov rdx, rax
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, logo1
	int	80h

	call _read
	
	mov ah, [input]
	sub ah, '0'

	cmp ah, 0
	je _exit
	cmp ah, 1
	je _prog1
	cmp ah, 2
	je _prog2
	cmp ah, 3
	je _prog3
	cmp ah, 3
	je _prog3
	jmp start
	ret

_read:
	mov rax, 3
	mov rbx, 0
	mov rcx, input
	mov rdx, 2
	int 80h
	ret

_prog1:
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, txt1
	mov	rdx, len1
	int	80h
	jmp start

_prog2:
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, txt2
	mov	rdx, len2
	int	80h
	jmp start

_prog3:
	mov	rax, 4
	mov	rbx, 1
	mov	rcx, txt3
	mov	rdx, len3
	int	80h
	jmp start

_exit:
	mov rax, 1	;sys_exit
	mov rbx,0
	int 0x80
