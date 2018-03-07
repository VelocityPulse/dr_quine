section .data
nl db 10, 0
qmark db 34, 0
fmt_compile db "", 0
fmt_copy db "", 0
fmt_sully_x db "Sully_%d.s", 0
fmt_debug db "debug %d", 10, 0 ; to remove

section .text
global _main
extern _dprintf
extern _sprintf
extern _printf ; to remove

_main:
push rbp
mov rbp, rsp

push 0
pop rsi
cmp rsi, 0
jle exit

lea rdi, [rel fmt_debug]
mov rsi, 1
call _printf


exit:
leave
ret
