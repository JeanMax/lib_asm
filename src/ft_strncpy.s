;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strncpy.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:30:40 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 22:07:11 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

global	ft_strncpy
extern	ft_strlen
	section	.text

ft_strncpy:
	push	rdi
	push	rsi
	mov		rdi,	rsi
	call	ft_strlen
	inc		rax
	pop		rsi
	pop		rdi
	cmp		rdx,	rax
	jl		lower
	mov		rcx,	rax		;counter
	rep		movsb			;while (rcx--) *rdi++ = *rsi++
	ret

lower:
	mov		rcx,	rdx		;counter
	rep		movsb			;while (rcx--) *rdi++ = *rsi++
	ret