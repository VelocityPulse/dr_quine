%macro m1 0
%endmacro
%macro m2 0
%endmacro

%macro main 0
section .data
nl db 10, 0
qmark db 34, 0
comment db 59, 0
kidname db "Grace_kid.s", 0
fmt db "%%macro m1 0%s%%endmacro%1$s%%macro m2 0%1$s%%endmacro%1$s%1$s%%macro main 0%1$ssection .data%1$snl db 10, 0%1$sqmark db 34, 0%1$scomment db 59, 0%1$skidname db %2$sGrace_kid.s%2$s, 0%1$sfmt db %2$s%3$s%2$s, 0%1$s%1$s%4$s my comment%1$ssection .text%1$sglobal _main%1$sextern _dprintf%1$s%1$s_main:%1$spush rbp%1$smov rbp, rsp%1$s%1$smov rax, 0x2000005%1$slea rdi, [rel kidname]%1$smov rsi, 0x201%1$smov rdx, 666o%1$ssyscall%1$s%1$smov r15, rax%1$s%1$scmp r15, -1%1$sje exit%1$scmp r15, 2%1$sje exit%1$s%1$smov rdi, r15%1$slea rsi, [rel fmt]%1$slea rdx, [rel nl]%1$slea rcx, [rel qmark]%1$slea r8, [rel fmt]%1$slea r9, [rel comment]%1$scall _dprintf%1$s%1$smov rax, 0x2000006%1$smov rdi, r15%1$ssyscall%1$s%1$sexit:%1$sleave%1$sret%1$s%%endmacro%1$smain%1$s", 0

; my comment
section .text
global _main
extern _dprintf

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
