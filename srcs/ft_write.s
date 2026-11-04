section .text
	global ft_write
	extern __errno_location

ft_write:
	mov rax, 1
	syscall

	cmp rax, -4095 ; if rax negative and > -4095
	jae .error

	ret

.error:
	neg rax
	mov rdi, rax
	push rdi ; preserve errno

	call __errno_location wrt ..plt

	pop rdi
	mov [rax], edi

	mov rax, -1
	ret