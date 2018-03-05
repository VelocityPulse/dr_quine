;comment1
section .data
nl db 10, 0
qmark db 34, 0
comment db 59, 0
fmt db "%4$scomment1%1$ssection .data%1$snl db 10, 0%1$sqmark db 34, 0%1$scomment db 59, 0%1$sfmt db %2$s%3$s%2$s, 0%1$ssection .text%1$sglobal _main%1$sglobal _func%1$sextern _printf%1$s_main:%1$s%4$scomment2%1$spush rbp%1$smov rbp, rsp%1$slea rdi, [rel fmt]%1$slea rsi, [rel nl]%1$slea rdx, [rel qmark]%1$slea rcx, [rel fmt]%1$slea r8, [rel comment]%1$scall _printf%1$scall _func%1$sleave%1$sret%1$s_func:%1$sret%1$s", 0
section .text
global _main
global _func
extern _printf
_main:
;comment2
push rbp
mov rbp, rsp
lea rdi, [rel fmt]
lea rsi, [rel nl]
lea rdx, [rel qmark]
lea rcx, [rel fmt]
lea r8, [rel comment]
call _printf
call _func
leave
ret
_func:
ret
