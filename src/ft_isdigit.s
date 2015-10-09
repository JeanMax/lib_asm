;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isdigit.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:29:31 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/08 17:58:42 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	;; >= '0' && <= '9'	->	true

global	ft_isdigit
	section	.text

ft_isdigit:
 	add	rdi,	-48		;move the true area to a 0 start
 	cmp	rdi,	10		;cmp 'substraction' affects Carry Flag
	sbb	rax,	rax		;x - x - CF = -CF : -1 if cmp overflowed, else 0
	and	rax,	1		;& operator swap -1 into 1, and let 0 as it was :)
	ret

	;;or looser version: :D

	;;ft_isdigit:
	;; 	cmp	rdi,	'0'
	;; 	jl	false
	;; 	cmp	rdi,	'9'
	;; 	jg	false
	;; 	mov	rax,	1
	;; 	ret
	;;false:
	;; 	mov	rax,	0
	;; 	ret
