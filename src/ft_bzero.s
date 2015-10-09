;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_bzero.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:28:59 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 17:56:01 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

global	ft_bzero
	section	.text

ft_bzero:
	mov		rcx,	rsi		;counter
	mov		rax,	0		;to copy
	rep		stosb			;while (rcx--) *rdi = rax, rdi++
	ret
