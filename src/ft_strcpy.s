;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:30:40 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 22:07:11 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

global	ft_strcpy
extern	ft_strlen
	section	.text

ft_strcpy:
	push	rdi
	push	rsi
	mov		rdi,	rsi
	call	ft_strlen
	inc		rax
	mov		rcx,	rax		;counter
	pop		rsi
	pop		rdi
	rep		movsb			;while (rcx--) *rdi++ = *rsi++
	ret
