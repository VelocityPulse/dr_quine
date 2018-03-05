%macro data 0
%endmacro
%macro program 0
%endmacro

%macro main 0
push rbp
mov rbp, rsp
leave
ret
%endmacro


section .data
;nl db 10, 0
;qmark db 34, 0
;comment db 59, 0
;fmt db ""
section .text
global start
global main
extern _printf
start:
	call main
