bits 64

extern __errno_location

global ft_read
section .text

; ssize_t read(int fildes, void *buf, size_t nbyte);
; rax     read(    rdi   ,     rsi  ,      rdx    );
ft_read:
	mov rax, 0x00
	syscall
	cmp rax, 0
	jl .errno_error
	ret

.errno_error:
	neg rax
	mov rdi, rax
	call __errno_location wrt ..plt
	mov [rax], rdi
	mov rax, -1
	ret