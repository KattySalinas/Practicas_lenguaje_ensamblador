;***Katty Salinas Rosales***

%macro imprime 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80H
%endmacro

%macro lee 1
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, 1
    int 80H
%endmacro

section .data
    m_suma db "La suma es", 10
    longitud_ms equ $-m_suma
    m_resta db "La resta es", 10
    longitud_mr equ $-m_resta
    m_multiplicacion db "La multiplicaciòn es", 10
    longitud_mmul equ $-m_multiplicacion
    m_division db "La division es", 10
    longitud_mdiv equ $-m_division
    m_residuo db "Y el residuo es", 10
    longitud_mres equ $-m_residuo
    e db "", 10
    le EQU $-e

section .bss
    suma resb 1
    resta resb 1
    multiplicacion resb 1
    division resb 1
    residuo resb 1

section .text
    global _start

_start:
    ;*********operaciones de los numeros********
    mov al, 4
    mov bl, 2
    add al, bl
    add al, '0'

    mov [suma], al

    mov al, 4
    mov bl, 2
    sub al, bl
    add al, '0'

    mov [resta], al   

    mov al, 2
    mov bl, 4
    mul bl
    add al, '0'

    mov [multiplicacion], al 

    mov al, 4
    mov bh, 2
    div bh
    add al, '0'
    add ah, '0'
    mov [division], al
    mov [residuo], ah

    ;*********mostar suma***********
    imprime m_suma, longitud_ms
    lee suma
    imprime e, le

    ;*********mostrar resta***********
    imprime m_resta, longitud_mr
    lee resta
    imprime e, le

    ;*********mostrar multiplicacion***********
    imprime m_multiplicacion, longitud_mmul
    lee multiplicacion
    imprime e, le

    ;*********mostrar mensaje***********
    imprime m_division, longitud_mdiv
    lee division
    imprime e, le

    ;*********mostrar mensaje residuo***********
    imprime m_residuo, longitud_mres
    lee residuo
    imprime e, le

    mov eax, 1
    mov ebx, 0
    int 80H

