;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:30:40 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 22:07:11 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

global	ft_memcpy
	section	.text

ft_memcpy:
	mov		rcx,	rdx		;counter
	mov		rax,	rdi		;saving ptr
	rep		movsb			;while (rcx--) *rdi++ = *rsi++
	ret
