;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_puts.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:30:21 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 22:41:37 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%define	STDOUT	1
%define	WRITE	0x04
	
global	ft_puts
extern	ft_strlen
	section	.text

ft_puts:
	push	rdi
	call	ft_strlen
	mov		rdx,	rax
	pop		rcx
	mov		rbx,	STDOUT
	mov		rax,	WRITE
	syscall
	ret
