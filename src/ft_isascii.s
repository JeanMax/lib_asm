;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isascii.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:29:48 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/08 17:35:55 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	;; >= 0 && <= 127	->	true

global	ft_isascii
	section	.text

ft_isascii:	
 	cmp	rdi,	128		;cmp 'substraction' affects Carry Flag
	sbb	rax,	rax		;x - x - CF = -CF : -1 if cmp overflowed, else 0
	and	rax,	1		;& operator swap -1 into 1, and let 0 as it was :)
	ret

	;;or looser version: :D

	;;ft_isascii:
	;; 	cmp	rdi,	0
	;; 	jl	false
	;; 	cmp	rdi,	127
	;; 	jg	false
	;; 	mov	rax,	1
	;; 	ret
	;;false:
	;; 	mov	rax,	0
	;; 	ret

