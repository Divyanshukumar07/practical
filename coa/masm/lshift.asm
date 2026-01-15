.model small
.stack 100h
.data
    prompt db 'a << 1 = $'
    num1 dw 10
.code
main proc
    mov ax, @data
    mov ds, ax

    mov ah, 09h
    mov dx, offset prompt
    int 21h

    mov ax, num1
    shl ax, 1          
    call printnumb

    mov ah, 4Ch
    int 21h
main endp
printnumb proc
   	mov cx, 0
    	mov bx, 10
    convLoop:
    	xor dx, dx
    	div bx
    	push dx
    	inc cx
    	cmp ax, 0
    	jne convLoop
    printLoop:
    	pop dx
    	add dl, '0'
    	mov ah, 02h
    	int 21h
    	loop printLoop
printnumb endp
end main