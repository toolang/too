.text
    .global main
main:
	call std_initmalloc
	call runtime_gc_gc_init
    mov (%rsp),%rdi
    lea 16(%rsp),%rsi
	call runtime_args_init
	call main_main
	mov $0,%rdi
	call std_die
    leaveq
    retq
	