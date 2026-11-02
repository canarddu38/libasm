section .text
	global ft_strcpy

ft_strcpy:
	mov rax, 0

.loop:
	cmp byte [rsi + rax], 0
	je .end

	mov bh, [rsi + rax]
	mov [rdi + rax], bh
	
	inc rax
	jmp .loop

.end:
	mov byte [rdi + rax], 0
	ret