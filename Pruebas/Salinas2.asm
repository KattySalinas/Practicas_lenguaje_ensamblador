;suma de cuadrados de una serie n numeros
;katty Salinas
%macro imprime 2
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro
%macro leer 2
    mov eax, 3
    mov ebx, 0
    mov ecx, %1
    mov edx, %2
    int 80h
%endmacro

section .data
    msjN db "Ingrese un numero: "
    lenM equ $-msjN

    m_serie db "La serie es la siguiente: ", 5
    lm equ $-m_serie

    m_suma db 10, "La suma de la serie es: ", 5
    ls equ $-m_suma

    e db ' '
    le equ $-e

    enterr db 10, ''
    l_e equ $-enterr

section .bss
    aux resb 2
    entrada resb 2
    imp resb 5
    suma resb 2
    ed resb 5

section .text
    global _start

_start:
    imprime msjN, lenM
    leer entrada, 1
    imprime m_serie, lm

    mov edx, 0              ;valor para incrementar
    mov ebx, 0

principal:
    mov eax, [entrada]      ;limite de la serie
	push rax

    inc edx
    push rdx
    add edx, '0'
    mov [aux], edx

    ;realiza la potencia del numero
    mov ax, [aux]
    sub ax, '0'
    mov bx, [aux]
    sub bx,'0'
    mul bx
    add ax, '0'
    mov [imp], ax

    ;suma de la serie
    add [suma], ax
    mov ebx, [suma]
    sub ebx, '0'
    mov [ed], ebx
 

	imprime imp, 1
    imprime e, le
    pop rdx

	pop rax
	sub eax, '0'
	dec eax	
	mov ecx, eax
	add eax, '0'
	mov [entrada], eax	

	cmp ecx, 0

	jz salir
	jmp principal

    
salir:
    
    imprime m_suma, ls
    imprime ed, 1

    imprime enterr, l_e
    mov eax, 1
    int 80h