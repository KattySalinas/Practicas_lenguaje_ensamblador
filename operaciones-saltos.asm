;****Katty Salinas****
%macro imprime  2
    mov eax , 4  
    mov ebx , 1  
    mov ecx , %1 
    mov edx , %2 
    int 80H 
%endmacro

%macro escribir  1
    mov eax , 3   
    mov ebx , 0  
    mov ecx , %1 
    mov edx , 2  
    int 80H 
%endmacro

%macro lee  1
    mov eax , 4  
    mov ebx , 1  
    mov ecx , %1 
    mov edx , 1  
    int 80H 
%endmacro

section .data
    mensaje_1 db "Ingrese primer numero" , 10 
    longitud_1 EQU $ - mensaje_1
    mensaje_2 db 10,"Ingrese segundo numero" , 10 
    longitud_2 EQU $ - mensaje_2
    m_suma db 10,"Suma" , 10 
    longitud_ms equ $ - m_suma
    m_resta db "Resta" , 10 
    longitud_mr equ $ - m_resta
    m_multiplicacion db "Multiplicacion" , 10 
    longitud_mmul equ $ - m_multiplicacion
    m_division db "Division" , 10 
    longitud_mdiv equ $ - m_division
    ssalir db "Salir" , 10 
    l_salir equ $ -ssalir
    rresultado db 10,"El resultado es" , 10 
    l_resultado equ $ -rresultado
    escoger db 10,'Escoja una opcion: ',0
    l_escoger equ $ -escoger
    e db "" , 10 
    le EQU $ - e

section .bss
    numeone: resb 2
    numetwo: resb 2
    opcion: resb 2
    resultado: resb 2 
    
section .text
 	global _start
 
_start:

    imprime mensaje_1, longitud_1
    escribir numeone
    imprime mensaje_2 , longitud_2
    escribir numetwo

menu:
    ;********************menu******************
	imprime m_suma , longitud_ms
	imprime m_resta , longitud_mr
	imprime m_multiplicacion , longitud_mmul
	imprime m_division , longitud_mdiv
    imprime ssalir, l_salir


	;***************mensaje de opcion**********
  	imprime escoger, l_escoger

	;************leer la opcion************
    escribir opcion

	mov ah, [opcion]
	sub ah, '0'

	cmp ah, 1
	JE sumar
	
	cmp ah, 2
	JE restar

	cmp ah, 3
	JE multiplicar

	cmp ah, 4
	JE dividir

	cmp ah, 5
	JE salir
	
	jmp salir
sumar:

	mov al, [numeone]
    ;sub al, '0'
    mov bl, [numetwo]
    ;sub bl, '0'
    add al, bl
    sub al, '0'

    mov [resultado], al
 

	imprime rresultado, l_resultado

	imprime resultado, 1

    jmp menu

restar:
	mov al, [numeone]
    ;sub al, '0'
    mov bl, [numetwo]
    ;sub bl, '0'
    sub al, bl
    add al, '0'

    mov [resultado], al
 

	imprime rresultado, l_resultado
 
	imprime resultado, 1

    jmp menu

multiplicar:

 mov al, [numeone]
    sub al, '0'
    mov bl, [numetwo]
    sub bl, '0'
    mul bl
    add al, '0'

   mov [resultado], al
 

	imprime rresultado, l_resultado

	imprime resultado, 1

    jmp menu
dividir:

	mov al, [numeone]
	mov bl, [numetwo]
 
	mov dx, 0
	mov ah, 0
 
	sub al, '0'
	sub bl, '0'
	div bl
 

	add ax, '0'
 

	mov [resultado], ax
 

	imprime rresultado, l_resultado
 
	imprime resultado, 1

    jmp menu
 
salir:
    mov eax , 1  
    mov ebx , 0  
    int 80H 

    
 
 