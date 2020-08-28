%macro imprime 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80H
%endmacro
%macro lee 1
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, 2
    int 80H
%endmacro
section .data
    mensaje db "Ingrese 5 numeros", 10
    l_mensaje equ $-mensaje

    numero_menor db "El numero menor es", 10
    l_numerom equ $-numero_menor

    arreglo db 0, 0, 0, 0, 0
    l_arreglo equ $-arreglo

section .bss
    numero resb 2

section .text
    global _start

_start:
    mov esi, arreglo
    mov edi, 0

    imprime mensaje, l_mensaje

leer: 
    lee numero
    mov al, [numero]
    sub al, '0'

    mov [esi], al ;movemos el valor al indice del arreglo

    inc edi
    inc esi

    cmp edi, l_arreglo
    jb leer

    mov ecx, 0
    mov bl, 9

comparacion:
    mov al, [arreglo + ecx]   
    cmp al, bl
    ja contador
    mov bl, al

contador:
    inc ecx
    cmp ecx, l_arreglo
    jb comparacion

imprimir:
    add bl, '0'
    mov [numero], bl
    
    imprime numero_menor, l_numerom

    imprime numero, 1

    mov eax, 1
    int 80h