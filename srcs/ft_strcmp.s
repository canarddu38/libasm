section .text
	global ft_strcmp

ft_strcmp:
	mov rax, 0

.loop:
	mov bh, [rsi + rax]
	or byte bh, [rdi + rax]
	cmp byte bh, 0
	je .end

	mov bh, [rsi + rax]
	cmp byte bh, [rdi + rax]
	je .diff_result
	
	inc rax
	jmp .loop

.diff_result:
	mov rax, al
	ret

.end:
	ret