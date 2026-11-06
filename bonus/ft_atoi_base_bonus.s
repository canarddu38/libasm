section .text:
	global ft_atoi_base

ft_atoi_base:
	; rdi str
	; rsi base

	mov rcx, 0 ; i = 0
	mov rdx, 0 ; result = 0
	movzx rbx, 1 ; sign = 1

.loop:
	mov r8b, [rdi + rcx] ; r8b = str[i]

	cmp r8b, 0
	je .end

	mov r8b, [rsi + r8b]


	inc rcx

.end:
	imul rdx, rbx ; result * sign
	mov rax, rdx
	ret

.index_of:
	... TODO:
