;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_putstr_fd.s                                     :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:30:21 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 22:41:37 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%define	STDOUT	1
%define	WRITE	0x2000004

section	.text
	global	ft_putstr_fd
	extern	ft_strlen

ft_putstr_fd:
	test	rdi,	rdi
	jz		fail
	push	rdi
	call	ft_strlen
	mov		rdx,		rax
	mov		rdi,		rsi
	pop		rsi
	mov		rax,		WRITE
	syscall
	ret

fail:
	mov		rdx,		7
	lea 	rsi,		[rel fail_s]
	mov		rdi,		STDOUT
	mov		rax,		WRITE
	syscall
	ret

section .data
	fail_s  db  "(null)", 10
