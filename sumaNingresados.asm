section .data
    mensaje_1 db "Ingrese primer numero", 10
    longitud_1 EQU $-mensaje_1
    mensaje_2 db "Ingrese segundo numero", 10
    longitud_2 EQU $-mensaje_2
    mensaje_s db "La suma es", 10
    longitud_s EQU $-mensaje_s
    e db "", 10
    le EQU $-e

section .bss
    numeone resb 1
    numetwo resb 1
    suma resb 1
    
section .text
    global _start
_start:

        ;**********imprime mensaje 1****************
        mov eax, 4 
        mov ebx, 1
        mov ecx, mensaje_1
        mov edx, longitud_1
        int 80H

        ;**********escritura de numero1**************
        mov eax, 3 
        mov ebx, 2
        mov ecx, numeone
        mov edx, 5
        int 80H

        ;**********imprime mensaje 2****************
        mov eax, 4 
        mov ebx, 1
        mov ecx, mensaje_2
        mov edx, longitud_2
        int 80H

        ;**********escritura de mensaje 2****************
        mov eax, 3 
        mov ebx, 2
        mov ecx, numetwo
        mov edx, 5
        int 80H

        ;**********suma de los numeros****************
        mov eax, [numeone]
        ;sub eax, '0'
        mov ebx, [numetwo]
        ;sub ebx, '0'
        add eax, ebx
        sub eax, '0'

        mov [suma], eax

        ;**********lectura mensaje suma****************
        mov eax, 4 
        mov ebx, 1
        mov ecx, mensaje_s
        mov edx, longitud_s
        int 80H

        ;**********lectura suma****************
        mov eax, 4 
        mov ebx, 1
        mov ecx, suma
        mov edx, 1
        int 80H

        ;**********imprime mensaje 2****************
        mov eax, 4 
        mov ebx, 1
        mov ecx, e
        mov edx, le
        int 80H

        mov eax, 1
        mov ebx, 0
        int 80H

