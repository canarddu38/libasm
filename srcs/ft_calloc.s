section .text
    global ft_calloc
    extern malloc

ft_calloc:
    ; check mul overflow
    mov rax, rdi
    mul rsi

    test rdx, rdx
    jnz .error ; overflow

    mov rdi, rax
    push rdi
    call malloc wrt ..plt
    pop rcx ; rcx = total_size

    test rax, rax
    jz .error

    ; clear memory
    mov rdi, rax

    mov rdx, 0 ; i = 0

.loop:
    cmp rdx, rcx
    jge .end

    mov byte [rdi + rdx], 0
    inc rdx
    jmp .loop

.end:
    mov rax, rdi
    ret

.error:
    mov rax, 0
    ret