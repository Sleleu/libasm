bits 64

section .text
global ft_strcmp

; int ft_strcmp(const char *s1, const char *s2);
ft_strcmp:
	xor rax, rax

.loop:
	movzx rbx, byte [rdi + rax] ; move byte of s1
	movzx rcx, byte [rsi + rax] ; move byte of s2
	cmp rbx, rcx ; compare two bytes
	jne .diff
	
	cmp rbx, 0 ; rbx and rxc are equal, if rbx == 0 then str are equals
	je .return
	inc rax
	jmp .loop

.diff:
	sub rbx, rcx ; substract value of rbx in rcx
	mov rax, rbx
	ret

.return:
	xor rax, rax
	ret