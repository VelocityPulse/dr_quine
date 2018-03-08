section .data
index dd 5
nl db 10, 0
qmark db 34, 0
fmt_compile db "", 0
fmt_copy db "section .data%1$sindex dd 5%1$snl db 10, 0%1$sqmark db 34, 0%1$sfmt_compile db %2$s%3$s%2$s, 0%1$sfmt_copy db %2$s%4$s%2$s, 0%1$sfmt_sully_x fb %2$sSully_%%d.s%2$s, 0%1$s%1$ssection .bss buff resb 100%1$s%1$ssection .text%1$sglobal _main%1$sextern _dprintf%1$sextern sprintf%1$sextern _bzero%1$s%1$s_main: push rbp%1$smov rbp, rsp%1$s%1$smov r15, [rel index]%1$smov rsi, r15%1$scmp rsi, 0%1$sjle exit%1$s%1$smov rdi, buff%1$slea rsi, [rel fmt_sully_x]%1$smov rdx, [rel index]%1$scall _sprintf%1$s%1$smov rax, 0x2000005%1$smov rdi, buff%1$smov rsi, 0%1$ssyscall%1$s%1$scmp rax, 2%1$sje pass%1$scmp rax, -1%1$sje pass%1$ssub r15, 1%1$s%1$spass:%1$smov rdi, buff%1$smov rsi, 100%1$scall _bzero%1$smov rdi, buff%1$slea rsi, [fmt_sully_x]%1$smov rdx, r15%1$scall _sprintf%1$s%1$smov rax, 0x2000005%1$smov rdi, buff%1$smov rsi, 0x210%1$smov rdx, 666o%1$syscall%1$s%1$smov r14, rax%1$scmp r14, 2%1$sje exit%1$scmp r14, -1%1$sje exit%1$s%1$s", 0
fmt_sully_x db "Sully_%d.s", 0
fmt_debug db "debug %d", 10, 0 ; TO REMOVE
fmt_debug2 db "debug : %s", 10, 0 ; TO REMOVE

section .bss
buff resb 100

section .text
global _main
global _debug ; TO REMOVE
extern _dprintf
extern _sprintf
extern _bzero
extern _printf ; TO REMOVE

_debug: ; TO REMOVE
push rbp ; TO REMOVE
mov rbp, rsp ; TO REMOVE
lea rdi, [rel fmt_debug] ; TO REMOVE
call _printf ; TO REMOVE
leave ; TO REMOVE
ret ; TO REMOVE

_main:
push rbp
mov rbp, rsp

mov r15, [rel index]
mov rsi, r15
cmp rsi, 0
jle exit

mov rdi, buff
lea rsi, [rel fmt_sully_x]
mov rdx, [rel index]
call _sprintf

mov rax, 0x2000005
mov rdi, buff
mov rsi, 0
syscall

cmp rax, 2
je pass
cmp rax, -1
je pass
sub r15, 1

pass:
mov rdi, buff
mov rsi, 100
call _bzero
mov rdi, buff
lea rsi, [rel fmt_sully_x]
mov rdx, r15
call _sprintf

mov rax, 0x2000005
mov rdi, buff
mov rsi, 0x201
mov rdx, 666o
syscall

mov r14, rax
cmp r14, 2
je exit
cmp r14, -1
je exit

mov rdi, r14
lea rsi, [rel fmt_copy]
lea rdx, [rel nl]
lea rcx, [rel qmark]
lea r8, [rel fmt_compile]
lea r9, [rel fmt_copy]
call _dprintf

mov rax, 0x2000006
mov rdi, r14
syscall

mov rdi, buff
mov rsi, 100
call _bzero
mov rdi, buff
lea rsi, [rel fmt_compile]
mov rdx, r15

mov rdi, buff
call _system

exit:
leave
ret
