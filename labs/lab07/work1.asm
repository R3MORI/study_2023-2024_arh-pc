%include 'in_out.asm'

section .data
msg: db "Наименьшее число: ", 0h
A dd 17
B dd 23
C dd 45

section .bss
min resb 0

section .text
global _start

_start:
mov eax, [A]
mov ebx, [B]
mov ecx, [C]

cmp eax, ebx
jle check_C
mov eax, ebx

check_C:
cmp eax, ecx
jle finish
mov eax, ecx

finish:
mov [min], eax

mov eax, msg
call sprint
mov eax, [min]
call iprintLF
call quit

