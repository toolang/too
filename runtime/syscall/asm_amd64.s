.text
    .global main
main:
    push %rbp
    mov %rsp, %rbp
    sub $0, %rsp
    push %rsi
    push %rdi
	mov std_initmalloc@GOTPCREL(%rip), %rax
	mov %rax,%r10
	mov $0, %rax
	call *%r10
    mov runtime_gc_gc_init@GOTPCREL(%rip), %rax
    mov %rax, %r10
    mov $0, %rax
    call *%r10
    pop  %rdi
    pop  %rsi
    mov runtime_args_init@GOTPCREL(%rip), %rax
    mov %rax,%r10
    call *%r10

    mov main_main@GOTPCREL(%rip), %rax
    mov %rax, %r10
    mov $0, %rax
    call *%r10
    mov %rbp, %rsp
    pop %rbp
    ret
	