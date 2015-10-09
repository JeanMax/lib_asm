;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isalpha.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:29:19 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 15:20:52 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	;; >= 'a' && <= 'z'	|| >= 'A' && <= 'Z'	->	true

global	ft_isalpha
extern	ft_islower
extern	ft_isupper
	section	.text

ft_isalpha:
	mov		rdx,	rdi
	call	ft_isupper
	cmp		rax,	0
	jne		kthxbye				;not uppercase: fail
	mov		rdi,	rdx
	jmp		ft_islower			;now check if it's lowercase :D

kthxbye:
	ret
