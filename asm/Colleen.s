%define MACH_SYSCALL(nb) 0x2000000 | nb

section .data
	msg: db "hello world!", 10
	len: equ $-msg

section .text
global start
global _main

start:
call _main
ret

_main:
mov rax, 4
mov rbx, 1
mov rcx, msg
mov rdx, len
mov rax, MACH_SYSCALL(4)
syscall
ret
