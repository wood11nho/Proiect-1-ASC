.data

	sirb16: .space 401
	sirb2: .space 401
	sir: .space 401
	formatScanf: .asciz "%s"
	formatPrintf: .asciz "%s "	
	formatPrintfnr: .asciz "%d "
	formatPrintfvar: .asciz "%c "
	formatPrintfNewLine: .asciz "\n"
	strmul: .asciz "mul"
	strlet: .asciz "let"
	stradd: .asciz "add"
	strsub: .asciz "sub"
	strdiv: .asciz "div"
	aux: .long 128
	indexsb2: .long 0
	n: .long 12
	imp: .long 2
	numar: .long 0
	z: .space 1
	aux1: .long 0
	cratima: .byte '-'
.text



.global main


main:

	
	//scanf("%s", &sirb16)
	
	pushl $sirb16
	pushl $formatScanf
	call scanf
	popl %ebx
	popl %ebx
	
	movl $sirb16, %esi
	movl $sirb2, %edi
	xorl %ecx, %ecx
	
etfor:

	movb (%esi, %ecx, 1), %al
	cmp $0, %al
	je codare
	cmp $48, %al
	je cif0
	cmp $49, %al
	je cif1
	cmp $50, %al
	je cif2
	cmp $51, %al
	je cif3
	cmp $52, %al
	je cif4
	cmp $53, %al
	je cif5
	cmp $54, %al
	je cif6
	cmp $55, %al
	je cif7
	cmp $56, %al
	je cif8
	cmp $57, %al
	je cif9
	cmp $65, %al
	je cifA
	cmp $66, %al
	je cifB
	cmp $67, %al
	je cifC
	cmp $68, %al
	je cifD
	cmp $69, %al
	je cifE
	cmp $70, %al
	je cifF
	
cont:
	incl %ecx
	jmp etfor
	
cif0:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont
	
cif1:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont

cif2:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont
	
cif3:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont
	
cif4:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont
	
cif5:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont	
	
cif6:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont		
	
	
cif7:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont	
	
cif8:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont
	
cif9:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont
	
	
cifA:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont	

cifB:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont

cifC:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont
	
	
cifD:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont	
	

cifE:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $48, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont
	
cifF:
	pushl %ecx
	
	movl indexsb2, %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	movb $49, (%edi, %ecx, 1)
	incl %ecx
	
	add $4, indexsb2
	
	popl %ecx
	jmp cont
	
codare:
	
	movl $sirb2, %esi
	movl $sir, %edi
	xorl %ecx, %ecx
	xorl %edx, %edx
	xorl %ebx, %ebx
	xorl %eax, %eax
	
etfor1:

	movb (%esi, %ecx, 1), %al
	movb %al, (%edi, %ebx, 1)
	cmp n, %ebx
	je afisare
	incl %ecx
	incl %ebx
	jmp etfor1
	
afisare:

	movl $1, %ebx
	movb (%edi, %ebx, 1), %al
	cmp $48, %al
	jne operatie
	incl %ebx
	movb (%edi, %ebx, 1), %al
	cmp $48, %al
	je intreg
	jmp variabila
	
operatie:

	movl $9, %ebx
	movb (%edi, %ebx, 1), %al
	cmp $48, %al
	jne div
	incl %ebx
	movb (%edi, %ebx, 1), %al
	cmp $48, %al
	jne submul
	incl %ebx
	movb (%edi, %ebx, 1), %al
	cmp $48, %al
	jne add
	jmp let
div:
	pushl %ecx
	pushl $strdiv
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	popl %ecx
	
	pushl %ecx
	pushl $0
	call fflush
	popl %ebx
	popl %ecx
	
	movb (%esi, %ecx, 1), %al
	cmp $0, %al
	je etexit
	
	xorl %ebx, %ebx
	movl $sir, %edi
	jmp etfor1

submul:
	
	incl %ebx
	movb (%edi, %ebx, 1), %al
	cmp $48, %al
	jne mul
	jmp sub

add:

	pushl %ecx
	pushl $stradd
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	popl %ecx
	
	pushl %ecx
	pushl $0
	call fflush
	popl %ebx
	popl %ecx
	
	movb (%esi, %ecx, 1), %al
	cmp $0, %al
	je etexit
	
	xorl %ebx, %ebx
	movl $sir, %edi
	jmp etfor1


let:

	pushl %ecx
	pushl $strlet
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	popl %ecx
	
	pushl %ecx
	pushl $0
	call fflush
	popl %ebx
	popl %ecx
	
	movb (%esi, %ecx, 1), %al
	cmp $0, %al
	je etexit
	
	xorl %ebx, %ebx
	movl $sir, %edi
	jmp etfor1

mul:

	pushl %ecx
	pushl $strmul
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	popl %ecx
	
	pushl %ecx
	pushl $0
	call fflush
	popl %ebx
	popl %ecx
	
	movb (%esi, %ecx, 1), %al
	cmp $0, %al
	je etexit
	
	xorl %ebx, %ebx
	movl $sir, %edi
	jmp etfor1


sub:

	pushl %ecx
	pushl $strsub
	pushl $formatPrintf
	call printf
	popl %ebx
	popl %ebx
	popl %ecx
	
	pushl %ecx
	pushl $0
	call fflush
	popl %ebx
	popl %ecx
	
	movb (%esi, %ecx, 1), %al
	cmp $0, %al
	je etexit
	
	xorl %ebx, %ebx
	movl $sir, %edi
	jmp etfor1




intreg:
	
	movl $0, numar
	movl aux, %eax
	movl $4, %ebx
	
etfor2:	

	cmp n, %ebx
	je afisare1
	movl %eax, aux1
	movb (%edi, %ebx, 1), %al
	cmp $49, %al
	je adaugare_suma
	movl aux1, %eax
	incl %ebx
	xorl %edx, %edx
	divl imp
	jmp etfor2
	
adaugare_suma:
	movl aux1, %eax
	addl %eax, numar
	incl %ebx
	xorl %edx, %edx
	divl imp
	jmp etfor2	

afisare1:
	
	movl $3, %ebx
	movb (%edi, %ebx, 1), %al
	cmp $49, %al
	jne afis
	
	cmp $0, numar
	jne etdif0
	pushl %ecx
	mov $4, %eax
	mov $1, %ebx
	mov $cratima, %ecx
	mov $1, %edx
	int $0x80
	popl %ecx
	
etdif0:
	movl %eax, aux1
	movl numar, %eax
	sub numar, %eax
	sub numar, %eax
	movl %eax, numar
	movl aux1, %eax
	
afis:	
	pushl %ecx
	pushl numar
	pushl $formatPrintfnr
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	
	popl %ecx
	
	movb (%esi, %ecx, 1), %al
	cmp $0, %al
	je etexit
	
	xorl %ebx, %ebx
	movl $sir, %edi
	jmp etfor1
	
variabila:	

	movl $0, numar
	movl aux, %eax
	movl $4, %ebx

etfor3:
	cmp n, %ebx
	je afisare2
	movl %eax, aux1
	movb (%edi, %ebx, 1), %al
	cmp $49, %al
	je adaugare_suma1
	movl aux1, %eax
	incl %ebx
	xorl %edx, %edx
	divl imp
	jmp etfor3
adaugare_suma1:
	movl aux1, %eax
	addl %eax, numar
	incl %ebx
	xorl %edx, %edx
	divl imp
	jmp etfor3
	
afisare2:
	
	pushl %ecx
	pushl numar
	pushl $formatPrintfvar
	call printf
	popl %ebx
	popl %ebx
	
	pushl $0
	call fflush
	popl %ebx
	popl %ecx
	
	movb (%esi, %ecx, 1), %al
	cmp $0, %al
	je etexit
	
	xorl %ebx, %ebx
	movl $sir, %edi
	jmp etfor1
	
		
etexit:

	pushl $formatPrintfNewLine
	call printf
	popl %ebx

	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80

