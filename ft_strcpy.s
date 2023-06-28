bits 64

section .text
global ft_strcpy

; char *ft_strcpy(char *dest, const char *src);
ft_strcpy:
	xor rax, rax ; i = 0
.loop:
	cmp byte [rsi + rax], 0; compare src and '\0'
	je .return ; jump if equal to return
	mov cl, [rsi + rax] ; move current byte in a 8 bits register
	mov [rdi + rax], cl ; move the byte in the second argument (dest)
	inc rax ; increment rax
	jmp .loop ; jump to begin of loop

.return:
	mov byte [rdi + rax], 0 ; add '\0' in the end of dest
	mov rax, rdi ; move dest in rax
	ret ; return
