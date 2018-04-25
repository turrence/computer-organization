	.file	"charCount.c"
	.section	.rodata
.LC0:
	.string	"Input a word: "
.LC1:
	.string	"%s"
.LC2:
	.string	"Character to search for: "
.LC3:
	.string	" %c"
.LC4:
	.string	"Occurs %d times!\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movl	$.LC0, %edi
	movl	$0, %eax
	call	printf
	leaq	-32(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC2, %edi
	movl	$0, %eax
	call	printf
	leaq	-33(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC3, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movzbl	-33(%rbp), %eax
	movsbl	%al, %edx
	leaq	-32(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	charCount
	movb	%al, -1(%rbp)
	movsbl	-1(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.globl	charCount
	.type	charCount, @function
charCount:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, %eax
	movb	%al, -28(%rbp)
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L4
	movl	$0, -4(%rbp)
	jmp	.L5
.L4:
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	-28(%rbp), %al
	jne	.L6
	movl	$1, -4(%rbp)
	jmp	.L7
.L6:
	movl	$0, -4(%rbp)
.L7:
	movsbl	-28(%rbp), %eax
	movq	-24(%rbp), %rdx
	addq	$1, %rdx
	movl	%eax, %esi
	movq	%rdx, %rdi
	call	charCount
	addl	%eax, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	charCount, .-charCount
	.ident	"GCC: (GNU) 4.8.5 20150623 (Red Hat 4.8.5-16)"
	.section	.note.GNU-stack,"",@progbits
