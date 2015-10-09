;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isblank.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:29:41 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/08 17:32:08 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	;; (i == ' ' || i == '\t') -> true

global	ft_isblank
	section	.text

ft_isblank:
	cmp	rdi,	32
	je	true
	cmp	rdi,	9
	je	true

false:
	mov	rax,	0
	ret

true:
	mov	rax,	1
	ret
