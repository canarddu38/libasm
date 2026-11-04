section .text
	global ft_strdup
	extern malloc
	extern ft_strlen

ft_strdup:
	mov rax, 0
	call ft_strlen

	; arg: (str) -> (garbage, str, size)
	mov rdx, rax
	mov rsi, rdi

	mov rdi, rdx
	call malloc
	mov rbx, rax

	mov rax, 0
.loop:
	cmp byte [rsi + rax], 0
	je .end

	mov [rsi + rax], [rsi + rax]

	inc rax
	jmp .loop


.end:
	mov rax, rbx
	ret