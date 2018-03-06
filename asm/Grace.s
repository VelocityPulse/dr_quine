%macro data 0
%endmacro
%macro program 0
%endmacro

%macro main 0
section .data
nl db 10, 0
qmark db 34, 0
comment db 59, 0
kidname db "Grace_kid.s", 0
fmt db "test test test", 10, 0

debug db "debug : %d", 10, 0


section .text
global _main
extern _dprintf
extern _printf ; to remove
_main:
push rbp
mov rbp, rsp

mov rax, 0x2000005
lea rdi, [rel kidname]
mov rsi, 0x201
mov rdx, 666o
syscall

mov r15, rax

cmp r15, -1
je exit
cmp r15, 2
je exit

mov rdi, r15
lea rsi, [rel fmt]
lea rdx, [rel nl]
lea rcx, [rel qmark]
lea r8, [rel fmt]
lea r9, [rel comment]
call _dprintf

mov rax, 0x2000006
mov rdi, r15
syscall
exit:
leave
ret
%endmacro
main
