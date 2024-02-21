%include 'in_out.asm'

SECTION .data
msg: db 'Введите значение x: ', 0
rem: db 'Результат выражения: ', 0

SECTION .bss
x: resb 80

SECTION .text
GLOBAL _start

_start:
mov eax, msg
call sprintLF

mov ecx, x
mov edx, 80
call sread

mov eax, x
call atoi

mov ebx, eax

mov eax, 2
mul ebx

add eax, 10
mov ecx, 3
div ecx

mov edi, eax

mov eax, rem
call sprint

mov eax, edi
call iprintLF
call quit
