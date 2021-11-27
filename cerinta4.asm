.data

	chDelim: .asciz " "
	formatPrintf: .asciz "%d "
	formatScanf: .asciz "%300[^\n]"
	strmul: .byte 'm'
	strdiv: .byte 'd'
	strsub: .byte 's'
	stradd: .byte 'a'
	strrot: .byte 'r'
	bit: .space 1
	var: .byte ''
	nrcol: .long 0
	nrlinii: .long 0
	nrelem: .long 0
	matrice: .space 1600
	res: .space 4
	k: .long 0
	k1: .long 0
	aux: .long 0
	sir: .space 400
	formatPrintfNewLine: .asciz "\n"
	endl: .asciz "\n"
	# poz   -	neg OKAY
	# poz   -	poz OKAY
	# neg	-	poz OKAY	
	# neg 	-	neg OKAY
	
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
salut:
	mov %eax, var
	
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
et11:
	movl %eax, res
	
	pushl res
	call atoi
	popl %ebx
	movl %eax, nrlinii
	
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	movl %eax, res
	pushl res
	call atoi
	popl %ebx
	movl %eax, nrcol
	
	movl nrlinii, %eax
	mull nrcol
	movl %eax, nrelem
	xorl %ecx, %ecx
	
	movl $matrice, %edi
etfor:
	cmp %ecx, nrelem
	je etlet
	
	pushl %ecx
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	movl %eax, res
	
	pushl res
	call atoi
	popl %ebx 
	popl %ecx		#voi avea in %eax int(res)
	
	movl %eax, (%edi, %ecx, 4)
	
	incl %ecx
	jmp etfor
	
etlet:
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
et_var_or_rot:

	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
eticheta:
	
	movl %eax, res
	movl res, %esi
	xorl %ecx, %ecx
	movb (%esi, %ecx, 1), %al
	cmp %al, strrot
	je etrotire				#etrotire
	jmp etvar
etvar:
	
	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	movl %eax, res
	pushl res
	call atoi
	popl %ebx
	
	movl %eax, k
	movl %eax, k1

	pushl $chDelim
	pushl $0
	call strtok
	popl %ebx
	popl %ebx
	
	movl %eax, res
	movl res, %esi
	xorl %ecx, %ecx
	movb (%esi, %ecx, 1), %al
	movb %al, bit
	xorl %ecx, %ecx
	
etfor2:
	cmp %ecx, nrelem
	je etafisare
	movb bit, %al
	movl (%edi, %ecx, 4), %ebx
	movl %ebx, aux
	cmp %al, strmul
	je etmul
	cmp %al, strdiv
	je etdiv
	cmp %al, stradd
	je etadd
	cmp %al, strsub
	je etsub
	
etmul:
	movl aux, %eax
	mull k
	jmp etschimbare
etdiv:
	movl k1, %eax
	movl %eax, k
	movl aux, %eax
	xorl %edx, %edx
	cmp $48, %eax
	jl schimbaresemn
	idivl k
	jmp etschimbare
schimbaresemn:	
	
	subl aux, %eax
	subl aux, %eax
	movl %eax, aux		#memorez 1 in aux
	movl k, %eax
	cmp $48, %eax
	jl semnplus
	subl k, %eax
	subl k, %eax
	movl %eax, k
	jmp operatie
semnplus:
	subl k, %eax
	subl k, %eax
	movl %eax, k
	jmp operatie
operatie:
	movl aux, %eax
	idivl k
	jmp etschimbare

etadd:
	movl aux, %eax
	addl k, %eax
	jmp etschimbare
etsub:
	movl aux, %eax
	subl k, %eax
	jmp etschimbare
	
etschimbare:
	
	movl %eax, (%edi, %ecx, 4)
	incl %ecx
	jmp etfor2

etafisare:

	xorl %ecx, %ecx
	pushl nrlinii
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl nrcol
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	
etforafis:

	cmp %ecx, nrelem
	je etexit
	
	movl (%edi, %ecx, 4), %eax
	
	pushl %ecx
	pushl %edx
	pushl %eax
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	popl %edx
	
	pushl $0
	call fflush
	popl %ebx
	popl %ecx
	
	incl %ecx
	jmp etforafis
	
etrotire:
	xorl %ecx, %ecx
	pushl nrcol
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	pushl nrlinii
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	
	xorl %ecx, %ecx	#ecx = 0
	movl nrlinii, %ebx
	subl $1, %ebx		#ebx = nrlinii - 1
	
	#for ( j = 0 ; j <nrcol ; j++)
		#for (i = nrlinii - 1; i >=0 ; i --)
		#	cout << a[i][j]<<" "
	movl $0, aux
etforj:
	cmp %ecx, nrcol
	je etexit
	etfori:
		cmp %ebx, aux
		jg resetare
		movl nrcol, %eax
		xorl %edx, %edx
		
		mull %ebx
		addl %ecx, %eax
		movl (%edi, %eax, 4), %edx
		
		pushl %ecx
		pushl %ebx
		pushl %edx
		pushl $formatPrintf
		call printf
		popl %eax
		popl %eax 
		
		pushl $0
		call fflush
		popl %eax
		popl %ebx
		popl %ecx
		
		subl $1, %ebx
		jmp etfori
	resetare:
		movl nrlinii, %ebx
		subl $1, %ebx
		incl %ecx
		jmp etforj
	
etexit:
	pushl $endl
	pushl $formatPrintfNewLine
	call printf
	popl %ebx
	popl %ebx
	
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
