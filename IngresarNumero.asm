
section .data
    mensaje db "Ingrese un numero", 10
    longitud_m equ $-mensaje
    mensaje_p db "El numero presentado es", 10
    longitud_mp equ $-mensaje_p

section .bss
    numero resb 5

section .text
    global _start

_start:
        ;**********imprime mensaje 1****************
        mov eax, 4 
        mov ebx, 1
        mov ecx, mensaje
        mov edx, longitud_m
        int 80H

        ;**********escritura de numero1*************
        mov eax, 3 
        mov ebx, 2
        mov ecx, numero
        mov edx, 5
        int 80H

        ;**********imprime mensaje de presentacion****************
        mov eax, 4 
        mov ebx, 1
        mov ecx, mensaje_p
        mov edx, longitud_mp
        int 80H

        ;**********imprime numero****************
        mov eax, 4 
        mov ebx, 1
        mov ecx, numero
        mov edx, 5
        int 80H

        mov eax, 1
        mov ebx, 0
        int 80H
    
