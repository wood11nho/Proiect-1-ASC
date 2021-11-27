.data

	chDelim: .asciz " "
	formatPrintf: .asciz "%d\n"
	formatScanf: .asciz "%300[^\n]"
	strmul: .byte 'm'
	strdiv: .byte 'd'
	strsub: .byte 's'
	stradd: .byte 'a'
	strlet: .byte 'l'
	n: .space 4
	res: .space 4
	res1: .space 4
	sir: .space 400
	frecv: .space 120
	bit: .space 1
	
.text

.global main

main:
	movl $frecv, %esi
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
	movl res, %edi
	xorl %ecx, %ecx
	movb (%edi, %ecx, 1), %al

	cmp $97, %al
	jge varr
	
	pushl res
	call atoi
	popl %ebx
	pushl %eax
	jmp etfor
	
varr:
	movl res, %ebx
	pushl %ebx
etfor:

	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	cmp $0, %eax
	je etexit
	
	movl %eax, res
	
comparare:

	movl res, %edi
	xorl %ecx, %ecx
	xorl %eax, %eax
	movb (%edi, %ecx, 1), %al
	cmp %al, strmul
	je etmul_m
	cmp %al, strdiv
	je etdiv_d
	cmp %al, stradd
	je etadd_a
	cmp %al, strsub
	je etsub_s
	cmp %al, strlet
	je etlet_l
	jmp numar_var
etmul_m:
	movl res, %edi
	movl $1, %ecx
	movb (%edi, %ecx, 1), %bl
	cmp $97, %bl
	jge inmultire
	jmp variabila
inmultire:
	popl %eax
	popl %ebx
	xorl %edx, %edx
	mull %ebx
	pushl %eax
	jmp etfor


etdiv_d:
	movl res, %edi
	movl $1, %ecx
	movb (%edi, %ecx, 1), %bl
	cmp $97, %bl
	jge impartire
	jmp variabila
impartire:
	popl %ebx
	popl %eax
	xorl %edx, %edx
	divl %ebx
	pushl %eax	
	jmp etfor

etadd_a:
	movl res, %edi
	movl $1, %ecx
	movb (%edi, %ecx, 1), %bl
	cmp $97, %bl
	jge adunare
	jmp variabila
	
adunare:
	popl %eax
	popl %ebx
	addl %ebx, %eax
	pushl %eax
	jmp etfor

etsub_s:
	movl res, %edi
	movl $1, %ecx
	movb (%edi, %ecx, 1), %bl
	cmp $97, %bl
	jge scadere
	jmp variabila
scadere:
	popl %ebx
	popl %eax
	sub %ebx, %eax
	pushl %eax
	jmp etfor

etlet_l:
	movl res, %edi
	movl $1, %ecx
	xorl %eax, %eax
	movb (%edi, %ecx, 1), %bl
	cmp $97, %bl
	jge letuire
	jmp variabila
letuire:
	popl %ebx
	popl %eax
salatini:
	
	movl %eax, res
	movl res, %edi
	movl $0, %ecx
	xorl %eax, %eax
	movb (%edi, %ecx, 1), %al
	movl $97, %ecx
etforascii:	
	
	cmp %eax, %ecx
	je good
	incl %ecx
	jmp etforascii
	
good:
	movl %ebx, (%esi, %ecx, 4) 
	jmp etfor
	
numar_var:

	cmp $96, %eax
	jg variabila
	
	mov res, %ebx
	pushl %ebx
	call atoi
	popl %ebx
	
	
	pushl %eax
	jmp etfor
	
variabila:
	
	
	movl $frecv, %esi
	movl (%esi, %eax, 4), %ebx
	cmp $0, %ebx
	jne inlocuire
	
	movl res, %eax
	pushl %eax
	jmp etfor
	
inlocuire:
	pushl %ebx
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
	
