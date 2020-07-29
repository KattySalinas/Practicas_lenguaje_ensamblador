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
    asterisco db "*", 10
    enterr db 10, " "
    e db "", 10
    le EQU $-e

section .text
    global _start

_start:
    mov ecx, 9      

l1: 
    push rcx 
    mov ebx, ecx
    push rbx
    lee enterr
    pop rbx
    mov ecx, 9
     
l2:    
    push rcx
    lee asterisco
    pop rcx
    loop l2
    pop rcx 
    loop l1

    imprime e, le

salir:
     mov eax, 1 
     int 80h


