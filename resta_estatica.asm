;***Katty Salinas Rosales***
section .data
    mresta db "La resta es", 10
    longitud_mr equ $-mresta
    e db "", 10
    le EQU $-e

section .bss
    resta resb 5

section .text
    global _start

_start:
    ;*********resta de los numeros********
    mov eax, 7
    mov ebx, 4
    sub eax, ebx
    add eax, '0'

    mov [resta], eax

    ;*********mostrar mensaje***********
    mov eax, 4
    mov ebx, 1
    mov ecx, mresta
    mov edx, longitud_mr
    int 80H

    ;*********mostrar resta***********
    mov eax, 4
    mov ebx, 1
    mov ecx, resta
    mov edx, 1
    int 80H

    ;**********imprime enter****************
    mov eax, 4 
    mov ebx, 1
    mov ecx, e
    mov edx, le
    int 80H

    mov eax, 1
    mov ebx, 0
    int 80H
