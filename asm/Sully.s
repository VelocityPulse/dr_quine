section .data
index db 2000
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

;mov rsi, [rel index]
;cmp rsi, 0
;jle exit

lea rdi, [rel fmt_debug]
lea rsi, [rel index]
call _printf

jmp exit

pop rdi
mov rsi, rdi
lea rdi, [rel fmt_debug]
call _printf

jmp exit

mov rdi, buff
lea rsi, [rel fmt_sully_x]
pop rdx
call _sprintf


lea rdi, [rel fmt_debug2]
mov rsi, buff
;call _printf




exit:
leave
ret

