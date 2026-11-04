section .text
	global ft_strcmp

ft_strcmp:
	mov rax, 0

.loop:
	movzx edx, byte [rdi + rax]
	movzx ecx, byte [rsi + rax]
	
	cmp ecx, edx
	jne .diff_result

	test ecx, ecx
	je .end

	inc rax
	jmp .loop

.diff_result:
	sub edx, ecx
	mov eax, edx
	ret

.end:
	mov rax, 0
	ret