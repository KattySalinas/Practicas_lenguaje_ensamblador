section .data
    msuma db "La suma es", 10
    longitud_ms equ $-msuma
section .bss
    suma resb 5

section .text
    global _start

_start:
    ;*********suma de los numeros********
    mov eax, 3
    mov ebx, 4
    add eax, ebx
    add eax, '0'

    mov [suma], eax

    ;*********mostrar mensaje***********
    mov eax, 4
    mov ebx, 1
    mov ecx, msuma
    mov edx, longitud_ms
    int 80H

    ;*********mostrar suma***********
    mov eax, 4
    mov ebx, 1
    mov ecx, suma
    mov edx, 1
    int 80H

    mov eax, 1
    mov ebx, 0
    int 80H


