.global std_write  
std_write:
	push   %rbp
	mov    %rsp,%rbp
	mov    %rdi,-0x18(%rbp)
	mov    %rsi,-0x20(%rbp)
	mov    %rdx,-0x28(%rbp)
	movq   $0x0,-0x8(%rbp)
	mov    $0x4,%rax
	mov    -0x18(%rbp),%rbx
	mov    -0x20(%rbp),%rcx
	mov    -0x28(%rbp),%rdx
	int    $0x80
	mov    %rax,-0x8(%rbp)
	mov    -0x8(%rbp),%rax
	pop    %rbp
	retq   
	