.text
    .global main
main:
    push %rbp
    mov %rsp, %rbp
    sub $0, %rsp
    push %rsi
    push %rdi
	call std_initmalloc
	call runtime_gc_gc_init
    pop  %rdi
    pop  %rsi
	call runtime_args_init
	call main_main
    mov %rbp, %rsp
    pop %rbp
	mov $0,%rdi
	call std_die
    ret
	