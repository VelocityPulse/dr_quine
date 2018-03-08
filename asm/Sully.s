section .data
index dd 5
nl db 10, 0
qmark db 34, 0
fmt_compile db "nasm -f macho64 -DOSX Sully_%1$d.s && ld Sully_%1$d.o -macosx_version_min 10.8 -lSystem -o Sully_%1$d && rm Sully_*.o && ./Sully_%1$d", 0
fmt_copy db "section .data%1$sindex dd %5$d%1$snl db 10, 0%1$sqmark db 34, 0%1$sfmt_compile db %2$s%3$s%2$s, 0%1$sfmt_copy db %2$s%4$s%2$s, 0%1$sfmt_sully_x db %2$sSully_%%d.s%2$s, 0%1$s%1$ssection .bss%1$sbuff resb 100%1$s%1$ssection .text%1$sglobal _main%1$sextern _dprintf%1$sextern _sprintf%1$sextern _bzero%1$sextern _system%1$s%1$s_main:%1$spush rbp%1$smov rbp, rsp%1$s%1$smov r15, [rel index]%1$smov rsi, r15%1$scmp rsi, 0%1$sjle exit%1$s%1$smov rdi, buff%1$slea rsi, [rel fmt_sully_x]%1$smov rdx, [rel index]%1$scall _sprintf%1$s%1$smov rax, 0x2000005%1$smov rdi, buff%1$smov rsi, 0%1$ssyscall%1$s%1$scmp rax, 2%1$sje pass%1$scmp rax, -1%1$sje pass%1$ssub r15, 1%1$s%1$spass:%1$smov rdi, buff%1$smov rsi, 100%1$scall _bzero%1$smov rdi, buff%1$slea rsi, [rel fmt_sully_x]%1$smov rdx, r15%1$scall _sprintf%1$s%1$smov rax, 0x2000005%1$smov rdi, buff%1$smov rsi, 0x201%1$smov rdx, 666o%1$ssyscall%1$s%1$smov r14, rax%1$scmp r14, 2%1$sje exit%1$scmp r14, -1%1$sje exit%1$s%1$smov rdi, r14%1$slea rsi, [rel fmt_copy]%1$slea rdx, [rel nl]%1$slea rcx, [rel qmark]%1$slea r8, [rel fmt_compile]%1$slea r9, [rel fmt_copy]%1$smov r10, r15%1$scall _dprintf%1$s%1$smov rax, 0x2000006%1$smov rdi, r14%1$ssyscall%1$s%1$smov rdi, buff%1$smov rsi, 100%1$scall _bzero%1$smov rdi, buff%1$slea rsi, [rel fmt_compile]%1$smov rdx, r15%1$scall _sprintf%1$s%1$smov rdi, buff%1$scall _system%1$s%1$sexit:%1$sleave%1$sret%1$s", 0
fmt_sully_x db "Sully_%d.s", 0

section .bss
buff resb 100

section .text
global _main
extern _dprintf
extern _sprintf
extern _bzero
extern _system

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
mov r10, r15
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
call _sprintf

mov rdi, buff
call _system

exit:
leave
ret
