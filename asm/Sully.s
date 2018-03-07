section .data
nl db 10, 0
qmark db 34, 0
fmt_compile db "", 0
fmt_copy db "", 0
fmt_sully_x db "Sully_%d.s", 0
fmt_debug db "debug %d", 10, 0 ; TO REMOVE

section .text
global _main
global _debug ; TO REMOVE
extern _dprintf
extern _sprintf
extern _printf ; TO REMOVE

_debug: ; TO REMOVE
push rbp ; TO REMOVE
mov rbp, rsp ; TO REMOVE
lea rdi, [rel fmt_debug] ; TO REMOVE
mov rsi, 1 ; TO REMOVE
call _printf ; TO REMOVE
leave ; TO REMOVE
ret ; TO REMOVE

_main:
push rbp
mov rbp, rsp

push 2
pop rsi
cmp rsi, 0
jle exit

call _debug ; TO REMOVE

exit:
leave
ret

