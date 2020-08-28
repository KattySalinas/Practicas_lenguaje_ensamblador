%macro imprime 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80H
%endmacro

section .data
    mensaje db "El texto es el siguiente", 10
    l_mensaje equ $-mensaje

    archivo db "/home/kattys/Documentos/practicas ensamblador/archivos/archivo.txt"

section .bss
    texto resb 30
    idarchivo resb 1

section .text
    global _start

_start:
    ;******abrir archivo********
    mov eax, 5 ;servicio para crear archivos
    mov ebx, archivo
    mov ecx, 0

    mov rdx, 777h
    int 80H

    test eax, eax
    jz salir

    mov dword [idarchivo], eax
    imprime mensaje, l_mensaje
    ;mov dword [idarchivo], eax

    ;*******leer el archivo********
    mov eax, 3
    mov ebx, [idarchivo]
    mov ecx, texto
    mov edx, 15
    int 80H

    imprime texto, 15

    ;**********cerrar el archivo******************
    mov eax, 6 ;servicio para crear archivos
    mov ebx, [idarchivo]
    mov ecx, 0
    mov edx, 0
    int 80h

salir:
    mov eax, 1
    int 80h
