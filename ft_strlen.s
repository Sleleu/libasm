bits 64

section .text
global ft_strlen

ft_strlen:
	xor rax, rax ; set rax to zero
	
.loop:
	cmp byte [rdi + rax], 0 ; compare first arg + rax value to null byte
	je .return ; jump if equal
	inc rax ; increment rax
	jmp .loop ; return on begin of loop

.return:
	ret ; return rax value