SECTION .data
	lab4:      db "Yan Roman",10 
		lab4Len:   equ $ - lab4
SECTION .text
	global _start           

_start:                 
        mov eax, 4      
        mov ebx, 1    
        mov ecx, lab4
        mov edx, lab4Len
        int 80h       
	
	mov eax, 1       
        mov ebx, 0      
        int 80h
