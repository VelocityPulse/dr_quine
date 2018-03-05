/*
	comment1
*/
section .data
nl db 10, 0
qmark db 34, 0
tab db 9, 0
fmt db "section .data%snl db 10, 0%1$sqmark db 34, 0%1$sfmt db %2$s%3$s%2$s, 0%1$ssection .text%1$sglobal _main%1$sextern _printf%1$s_main:%1$spush rbp%1$smov rbp, rsp%1$slea rdi, [rel fmt]%1$slea rsi, [rel nl]%1$slea rdx, [rel qmark]%1$slea rcx, [rel fmt]%1$scall _printf%1$sleave%1$sret%1$s", 0
section .text
global _main
extern _printf
_main:
/*
	comment2
*/

; todo demander ce qu'il y a apres rcx
push rbp
mov rbp, rsp
lea rdi, [rel fmt]
lea rsi, [rel nl]
lea rdx, [rel qmark]
lea rcx, [rel fmt]
call _printf
leave
ret
