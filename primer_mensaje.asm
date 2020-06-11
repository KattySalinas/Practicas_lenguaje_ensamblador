section .data
    mensaje db "mi primer mensaje en nasm", 10
    longitud EQU $-mensaje

section .text
    global _start
_start:

        mov eax, 4 
        mov ebx, 1
        mov ecx, mensaje
        mov edx, longitud
        int 80H

        mov eax, 1
        mov ebx, 0
        int 80H
        