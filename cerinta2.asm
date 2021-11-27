.data

	chDelim: .asciz " "
	formatPrintf: .asciz "%d\n"
	formatScanf: .asciz "%300[^\n]"
	strmul: .byte 'm'
	strdiv: .byte 'd'
	strsub: .byte 's'
	stradd: .byte 'a'
	n: .long 0
	res: .space 4
	res1: .space 4
	sir: .space 400
	
.text


.global main

main:

	pushl $sir
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	pushl $chDelim
	pushl $sir
	call strtok
	popl %ebx
	popl %ebx
	
	movl %eax, res
	
	pushl res
	call atoi
	popl %ebx
	pushl %eax
	
etfor:

	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je etexit
	
	movl %eax, res
	movl res, %ebx
	movl %ebx, res1
	pushl res
	call atoi
	popl %ebx

	
comparare:

	
	movl res1, %edi
	xorl %ecx, %ecx
	movl %eax, n
	movb (%edi, %ecx, 1), %al
	cmp %al, strmul
	je etmul
	cmp %al, strdiv
	je etdiv
	cmp %al, stradd
	je etadd
	cmp %al, strsub
	je etsub
	jmp numar
etmul:
	popl %eax
	popl %ebx
	mull %ebx
	pushl %eax
	jmp etfor
	
etdiv:
	popl %ebx
	popl %eax
	xorl %edx, %edx
	divl %ebx
	pushl %eax	
	jmp etfor
etadd:
	popl %eax
	popl %ebx
	add %ebx, %eax
	pushl %eax
	jmp etfor
etsub:
	popl %ebx
	popl %eax
	sub %ebx, %eax
	pushl %eax
	jmp etfor
numar:
	
	movl n, %eax
	pushl %eax
	jmp etfor	

etexit:
	
	popl %eax
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
	
