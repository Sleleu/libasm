bits 64

extern malloc
extern ft_strlen
extern ft_strcpy

section .text
global ft_strdup

; char *strdup(const char *s)
ft_strdup:

	push rbp ; save rbp value on stack, rbp = base pointer
	mov rbp, rsp ; copy value of the stack pointer to the base pointer
	sub rsp, 8 ; create space to store address, decrement bc stack grow up to down
	mov qword [rbp - 8], rdi ; qword = 8 bytes
	call ft_strlen ; take size of s stored in rdi
	inc rax ; increment by 1 for '\0'
	mov rdi, rax ; rax get the size, so now place len in rdi for malloc
	call malloc wrt ..plt ; malloc return address in rax
	cmp rax, 0 ; check for error
	je .error

	mov rdi, rax ; place address returned by malloc in rdi for strcpy
	mov rsi, qword [rbp - 8]
	call ft_strcpy ; return malloc str in rax
	add rsp, 8
	pop rbp
	ret

.error:
	xor rax, rax ; set rax to null
	add rsp, 8
	pop rbp
	ret