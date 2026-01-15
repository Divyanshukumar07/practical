.model small
.stack 100h
.data
	prompt db 'a * b = $'
	num1 dw 6
	num2 dw 4
.code
main proc
	mov ax, @data
	mov ds, ax
	
	mov ah, 09h
	mov dx, offset prompt
	int 21h
	
	mov ax, num1
	mov bx, num2
	mul bx
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