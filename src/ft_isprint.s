;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isprint.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:29:55 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/08 17:53:29 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	;; >= 32 && <= 126	->	true
	
global	ft_isprint
	section	.text				

ft_isprint:
 	add	rdi,	-32		;move the true area to a 0 start
 	cmp	rdi,	95		;cmp 'substraction' affects Carry Flag
	sbb	rax,	rax		;x - x - CF = -CF : -1 if cmp overflowed, else 0
	and	rax,	1		;& operator swap -1 into 1, and let 0 as it was :)
	ret

	;;or looser version: :D
	
	;;ft_isprint:
	;; 	cmp	rdi,	32
	;; 	jl	false
	;; 	cmp	rdi,	126
	;; 	jg	false
	;; 	mov	rax,	1
	;;false:
	;; 	mov	rax,	0
	;; 	ret
