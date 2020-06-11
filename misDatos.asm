section .data
    nombres db "Katty Jackeline", 10
    longitud_n EQU $-nombres
    apellidos db "Salinas Rosales",10 
    longitud_a EQU $-apellidos
    materia db "Lenguaje Ensamblador",10
    longitud_m EQU $-materia
    genero db "Femenino",10
    longitud_g EQU $-genero

section .text
    global _start

    _start:

        mov eax, 4 
        mov ebx, 1
        mov ecx, nombres
        mov edx, longitud_n
        int 80H

        mov eax, 4 
        mov ebx, 1
        mov ecx, apellidos
        mov edx, longitud_a
        int 80H

        mov eax, 4 
        mov ebx, 1
        mov ecx, materia
        mov edx, longitud_m
        int 80H

        mov eax, 4 
        mov ebx, 1
        mov ecx, genero
        mov edx, longitud_g
        int 80H

        mov eax, 1
        mov ebx, 0
        int 80H
        
