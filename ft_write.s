bits 64

section .text
global ft_write

; ssize_t write(int fd, const void *buf, size_t count);
; rdi, rsi, and rdx are set by the caller
ft_write:
	mov rax, 1 ; syscall number of write
	syscall
	ret