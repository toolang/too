.global std_open  
std_open:
	mov    $0x2,%rax
	syscall
	retq   

.global std_read  
std_read:
	mov    $0,%rax
	syscall
	retq   

.global std_close  
std_close:
	mov    $0x3,%rax
	syscall
	retq  

.global std_write  
std_write:
	mov    $0x1,%rax
	syscall
	retq   

.global std_seek
std_seek:
	mov $0x8,%rax
	syscall
	retq
.global std_die
std_die:
	mov $60,%rax
	syscall
	retq
	