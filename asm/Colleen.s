%define MACH_SYSCALL(nb) 0x2000000 | nb
%define STDOUT 1
%define WRITE 4

section .data
hello:
	.msg db "hello world!", 10, 0
	.len equ $-hello.msg

section .text
global _main
extern _printf

_main:
push rbp
mov rbp, rsp
lea rdi, [rel hello.msg]
call _printf
leave
ret
