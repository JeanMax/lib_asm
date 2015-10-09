;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_islower.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/06 08:57:05 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 15:21:13 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	;; >= 'a' && <= 'z'	->	true

global	ft_islower
	section	.text

ft_islower:
 	add	rdi,	-97		;move the true area to a 0 start
 	cmp	rdi,	26		;cmp 'substraction' affects Carry Flag
	sbb	rax,	rax		;x - x - CF = -CF : -1 if cmp overflowed, else 0
	and	rax,	1		;& operator swap -1 into 1, and let 0 as it was :)
	ret

	;;or looser version: :D

	;;ft_islower:
	;; 	cmp	rdi,	'a'
	;; 	jl	false
	;; 	cmp	rdi,	'z'
	;; 	jg	false
	;; 	mov	rax,	1
	;; 	ret
	;;false:
	;; 	mov	rax,	0
	;; 	ret
