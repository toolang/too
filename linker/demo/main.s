.data
L001:
    .string "hello toolang!\n"

.text
.global write  
write:
	mov    $0x1,%rax
	syscall
	retq   

.global die
die:
	mov $60,%rax
	syscall
	retq

.global main_main
main_main:
    push %rbp
    mov %rsp, %rbp
	mov $1,%rdi
    lea L001(%rip), %rsi
	mov $15,%rdx
	call write
    mov %rbp, %rsp
    pop %rbp
    ret
