;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_cat.s                                           :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:31:01 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 15:20:31 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%define	WRITE		0x2000004
%define	READ		0x2000003
%define	STDOUT		1
%define BUFF_SIZE	64

section .bss
buff:	resb	BUFF_SIZE

global	ft_cat
section	.text

ft_cat:
	jl		kthxbye
	mov		rbx,	rdi		;saving fd to rbx

read:
	lea 	rsi,	[rel buff]
	mov		rdx,	BUFF_SIZE
	mov		rax,	READ
	syscall
	jc		kthxbye

write:
	cmp		rax,	0
	jl		kthxbye
	mov		rdx,	rax
	lea 	rsi,	[rel buff]
	mov		rdi,	STDOUT
	mov		rax,	WRITE
	syscall
	mov		rdi,	rbx
	jg		read

kthxbye:
	ret