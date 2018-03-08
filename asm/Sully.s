section .data
index dd 5
nl db 10, 0
qmark db 34, 0
fmt_compile db "", 0
fmt_copy db "", 0
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


exit:
leave
ret

