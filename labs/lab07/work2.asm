%include 'in_out.asm'

section .data
prompt: db "Введите значение x: ", 0
prompt_a: db "Введите значение a: ", 0
result_msg: db "Результат вычисления: ", 0

section .bss
x resb 10
a resb 10
result resb 10

section .text
global _start

_start:
; Вывод промпта для ввода x
mov eax, prompt
call sprintLF

; Ввод значения x
mov ecx, x
mov edx, 10
call sread

; Вывод промпта для ввода a
mov eax, prompt_a
call sprintLF

; Ввод значения a
mov ecx, a
mov edx, 10
call sread

; Преобразование строковых значений в числа
mov eax, x
call atoi
mov esi, eax ; сохраняем x в esi

mov eax, a
call atoi
mov edi, eax ; сохраняем a в edi

; Сравниваем x и a
cmp esi, edi
jl less_than_a

; Если x >= a, f(x) = 8
mov eax, 8
jmp print_result

less_than_a:
; Если x < a, f(x) = 2a - x
mov eax, edi
add eax, eax ; умножаем a на 2
sub eax, esi ; вычитаем x из результата

print_result:
; Вывод результата
mov eax, result_msg
call sprint
mov eax, eax
call iprintLF ; Печать результата

; Выход из программы
call quit
