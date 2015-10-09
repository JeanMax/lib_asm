;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalnum.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:29:41 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/08 17:55:58 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	;; >= 'a' && <= 'z'	|| >= 'A' && <= 'Z'	|| >= '0' && <= '9'	->	true

global	ft_isalnum
extern	ft_isalpha
extern	ft_isdigit
	section	.text

ft_isalnum:
	mov		rdx,	rdi
	call	ft_isdigit
	cmp		rax,	0
	jne		kthxbye				;not digit: fail
	mov		rdi,	rdx
	jmp		ft_isalpha			;now check if it's a letter :D

kthxbye:
	ret
