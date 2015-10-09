;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_toupper.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:30:14 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 15:23:32 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

global	ft_toupper
extern	ft_islower
	section	.text

ft_toupper:
	mov		rdx,	rdi
	call	ft_islower
	cmp		rax,	0
	mov		rax,	rdx			;cpy to return
	je		kthxbye				;not an uppercase letter, don't bother
	add		rax,	-32

kthxbye:
	ret
