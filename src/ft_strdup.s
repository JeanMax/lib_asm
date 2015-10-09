;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:30:46 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/09 16:52:23 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

global	ft_strdup
extern	malloc
extern	ft_memcpy
extern	ft_strlen
	section	.text

ft_strdup:
	push	rdi				;saving ptr to stack
	call	ft_strlen
	inc		rax
	push	rax				;saving len to stack
	mov		rdi,	rax
	call	malloc
	test	rax,	rax
	jz		kthxbye
	pop		rcx
	pop		rsi
	mov		rdi,	rax
	rep		movsb			;while (rcx--) *rdi++ = *rsi++

kthxbye:
	ret
