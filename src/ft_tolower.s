;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_tolower.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:30:06 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 15:23:24 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

global	ft_tolower
extern	ft_isupper
	section	.text

ft_tolower:
	mov		rdx,	rdi
	call	ft_isupper
	cmp		rax,	0
	mov		rax,	rdx			;cpy to return
	je		kthxbye				;not an uppercase letter, don't bother
	add		rax,	32

kthxbye:
	ret
