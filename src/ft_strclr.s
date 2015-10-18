;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strclr.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:28:59 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 17:56:01 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

global	ft_strclr
extern	ft_strlen
	section	.text

ft_strclr:
	push	rdi
	call	ft_strlen
	pop		rdi
	mov		rcx,	rax		;counter
	mov		rax,	0		;to copy
	rep		stosb			;while (rcx--) *rdi = rax, rdi++
	ret
	