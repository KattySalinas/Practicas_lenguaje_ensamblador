%macro imprime 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80H
%endmacro

section .data
    mensaje db "Ingrese datos en el archivo", 10
    l_mensaje equ $-mensaje

    archivo db "/home/kattys/Documentos/practicas ensamblador/archivos/archivo.txt"

section .bss
    texto resb 30
    idarchivo resb 1

section .text
    global _start

leer:   
    mov eax, 3
    mov ebx, 0
    mov ecx, texto
    mov edx, 10
    int 80H 
    ret


_start:
    mov eax, 8 ;servicio para crear archivos
    mov ebx, archivo
    mov ecx, 1

    mov rdx, 777h
    int 80H

    test eax, eax

    jz salir
    mov dword [idarchivo], eax
    imprime mensaje, l_mensaje
    ;mov dword [idarchivo], eax

    call leer

    ;*******escribir********
    mov eax, 4
    mov ebx, [idarchivo]
    mov ecx, texto
    mov edx, 20
    int 80H

salir:
    mov eax, 1
    int 80h
