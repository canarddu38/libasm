section .text
    global ft_strdup
    extern malloc
    extern ft_strlen

ft_strdup:
    push rbx
    push r12
	sub rsp, 8

    mov r12, rdi ; preserve str

    call ft_strlen

    lea rdi, [rax + 1] ; strlen + null terminator
    call malloc wrt ..plt

    test rax, rax
    jz .error

    mov rbx, rax ; dest
    mov rsi, r12 ; src

    mov rcx, 0 ; i = 0

.loop:
    mov dl, [rsi + rcx]
    mov [rbx + rcx], dl

    inc rcx

    test dl, dl
    jnz .loop

    mov rax, rbx ; ret allocated str

	add rsp, 8
    pop r12
    pop rbx
    ret

.error:
    mov rax, 0

	add rsp, 8
    pop r12
    pop rbx
    ret