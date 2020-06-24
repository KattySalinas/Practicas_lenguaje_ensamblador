section .data
    mdivision db "La division es", 10
    longitud_mdiv equ $-mdivision
    mresiduo db "Y el residuo es", 10
    longitud_mr equ $-mresiduo
    e db "", 10
    le EQU $-e

section .bss
    division resb 1
    residuo resb 1

section .text
    global _start

_start:
    ;*********division de los numeros********
    mov al, 5
    mov bh, 2
    div bh
    add al, '0'
    add ah, '0'
    mov [division], al
    mov [residuo], ah

    ;*********mostrar mensaje***********
    mov eax, 4
    mov ebx, 1
    mov ecx, mdivision
    mov edx, longitud_mdiv
    int 80H

    ;*********mostrar division***********
    mov eax, 4
    mov ebx, 1
    mov ecx, division
    mov edx, 1
    int 80H

    ;**********imprime espacio enter****************
    mov eax, 4 
    mov ebx, 1
    mov ecx, e
    mov edx, le
    int 80H

    ;*********mostrar mensaje***********
    mov eax, 4
    mov ebx, 1
    mov ecx, mresiduo
    mov edx, longitud_mr
    int 80H

    ;*********mostrar division***********
    mov eax, 4
    mov ebx, 1
    mov ecx, residuo
    mov edx, 1
    int 80H

    ;**********imprime espacio enter****************
    mov eax, 4 
    mov ebx, 1
    mov ecx, e
    mov edx, le
    int 80H

    mov eax, 1
    mov ebx, 0
    int 80H