	.section	__TEXT,__text,regular,pure_instructions
	.section	__TEXT,__const
	.align	4
LCPI0_0:
	.long	0                       ## 0x0
	.long	1                       ## 0x1
	.long	2                       ## 0x2
	.long	3                       ## 0x3
LCPI0_1:
	.long	4                       ## 0x4
	.long	5                       ## 0x5
	.long	6                       ## 0x6
	.long	7                       ## 0x7
LCPI0_2:
	.long	8                       ## 0x8
	.long	9                       ## 0x9
	.long	10                      ## 0xa
	.long	11                      ## 0xb
LCPI0_3:
	.long	12                      ## 0xc
	.long	13                      ## 0xd
	.long	14                      ## 0xe
	.long	15                      ## 0xf
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_addUpTo
	.align	4, 0x90
_addUpTo:                               ## @addUpTo
	.cfi_startproc
## BB#0:
                                        ## kill: EDI<def> EDI<kill> RDI<def>
	xorl	%eax, %eax
	testl	%edi, %edi
	je	LBB0_7
## BB#1:                                ## %.lr.ph.preheader
	movl	%edi, %eax
	andl	$-16, %eax
	leal	1(%rax), %ecx
	vpxor	%xmm0, %xmm0, %xmm0
	cmpl	$1, %ecx
	jne	LBB0_3
## BB#2:
	movl	$1, %ecx
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	jmp	LBB0_5
LBB0_3:
	xorl	%edx, %edx
	vmovdqa	LCPI0_0(%rip), %xmm8
	vmovdqa	LCPI0_1(%rip), %xmm9
	vmovdqa	LCPI0_2(%rip), %xmm10
	vmovdqa	LCPI0_3(%rip), %xmm11
	vpxor	%xmm1, %xmm1, %xmm1
	vpxor	%xmm2, %xmm2, %xmm2
	vpxor	%xmm3, %xmm3, %xmm3
	.align	4, 0x90
LBB0_4:                                 ## %vector.body
                                        ## =>This Inner Loop Header: Depth=1
	leal	1(%rdx), %esi
	vmovd	%esi, %xmm4
	vpshufd	$0, %xmm4, %xmm4        ## xmm4 = xmm4[0,0,0,0]
	vpaddd	%xmm8, %xmm4, %xmm5
	vpaddd	%xmm9, %xmm4, %xmm6
	vpaddd	%xmm10, %xmm4, %xmm7
	vpaddd	%xmm11, %xmm4, %xmm4
	vpaddd	%xmm5, %xmm0, %xmm0
	vpaddd	%xmm6, %xmm1, %xmm1
	vpaddd	%xmm7, %xmm2, %xmm2
	vpaddd	%xmm4, %xmm3, %xmm3
	addl	$16, %edx
	cmpl	%edx, %eax
	jne	LBB0_4
LBB0_5:                                 ## %middle.block
	leal	1(%rdi), %edx
	vpaddd	%xmm0, %xmm1, %xmm0
	vpaddd	%xmm0, %xmm2, %xmm0
	vpaddd	%xmm0, %xmm3, %xmm0
	vmovhlps	%xmm0, %xmm0, %xmm1 ## xmm1 = xmm0[1,1]
	vpaddd	%xmm1, %xmm0, %xmm0
	vphaddd	%xmm0, %xmm0, %xmm0
	vmovd	%xmm0, %eax
	cmpl	%ecx, %edx
	je	LBB0_7
	.align	4, 0x90
LBB0_6:                                 ## %.lr.ph
                                        ## =>This Inner Loop Header: Depth=1
	addl	%ecx, %eax
	incl	%ecx
	cmpl	%edi, %ecx
	jbe	LBB0_6
LBB0_7:                                 ## %._crit_edge
	ret
	.cfi_endproc


.subsections_via_symbols
