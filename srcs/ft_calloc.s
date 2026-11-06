section .text
    global ft_calloc
    extern malloc

ft_calloc:
	; rdi nmemb
	; rsi size

	; TODO: check nmemb * size size_t overflow

	imul rdi, rsi
	call malloc wrt ..plt

	test rax, rax
    jz .error

.error:
	

