bits 64

extern __errno_location

section .text
global ft_write

; ssize_t write(int fd, const void *buf, size_t count);
; rdi, rsi, and rdx are set by the caller
ft_write:
	mov rax, 1 ; syscall number of write
	syscall
	cmp rax, 0
	jl .errno_error
	ret

.errno_error:
	neg rax ; set rax to positive value
	mov rdi, rax ; store rax as arg for errno
	call __errno_location wrt ..plt ; set adress of errno var in rax, with respect to of processus linkage table
	mov [rax], rdi ; stock rdi value in address of rax
	mov rax, -1 ; set return value to -1
	ret