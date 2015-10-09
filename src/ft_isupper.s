;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isupper.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/06 09:00:16 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 15:21:34 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	;; >= 'A' && <= 'Z'	->	true

global	ft_isupper
	section	.text

ft_isupper:
 	add	rdi,	-65		;move the true area to a 0 start
 	cmp	rdi,	26		;cmp 'substraction' affects Carry Flag
	sbb	rax,	rax		;x - x - CF = -CF : -1 if cmp overflowed, else 0
	and	rax,	1		;& operator swap -1 into 1, and let 0 as it was :)
	ret

	;;or looser version: :D

	;;ft_isupper:
	;; 	cmp	rdi,	'A'
	;; 	jl	false
	;; 	cmp	rdi,	'Z'
	;; 	jg	false
	;; 	mov	rax,	1
	;; 	ret
	;;false:
	;; 	mov	rax,	0
	;; 	ret
