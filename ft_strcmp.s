bits 64

section .text
global ft_strcmp

; int ft_strcmp(const char *s1, const char *s2);
ft_strcmp:
	xor rax, rax

.loop:
	mov bl, [rdi + rax] ; move byte of s1
	mov cl, [rsi + rax] ; move byte of s2
	cmp bl, cl ; compare two bytes
	jne .diff
	
	cmp bl, 0 ; bl and cl are equal, if bl == 0 then str are equals
	je .return
	inc rax
	jmp .loop

.diff:
	sub bl, cl ; substract value of cl in bl
	movsx rax, bl ; move with sign extension
	ret

.return:
	xor rax, rax
	ret