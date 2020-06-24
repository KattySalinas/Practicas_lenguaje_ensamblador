;***Katty Salinas Rosales***
section .data
    mmultiplicacion db "La multiplicaciòn es", 10
    longitud_mmul equ $-mmultiplicacion
    e db "", 10
    le EQU $-e

section .bss
    mult resb 5

section .text
    global _start

_start:
    ;*********multiplicacion de los numeros********
    mov eax, 2
    mov ebx, 4
    imul eax, ebx
    add eax, '0'

    mov [mult], eax

    ;*********mostrar mensaje***********
    mov eax, 4
    mov ebx, 1
    mov ecx, mmultiplicacion
    mov edx, longitud_mmul
    int 80H

    ;*********mostrar multiplicacion***********
    mov eax, 4
    mov ebx, 1
    mov ecx, mult
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