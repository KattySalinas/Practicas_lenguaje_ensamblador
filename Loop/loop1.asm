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
    hola db 10, "hola: ", 5
    l_hola equ $-hola
    e db "", 10
    le EQU $-e

section .bss
    numero resb 5

section .text
    global _start

_start:
    mov ecx, 9    

for: 
    push rcx
    add ecx, '0'
    mov [numero], ecx
    ;push rdx
    imprime hola, l_hola
    lee numero
    pop rcx
    ;pop edx
    loop for
    imprime e, le

salir: 
    mov eax, 1
    int 80h
