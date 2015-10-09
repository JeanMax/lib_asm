;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_ispunct.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:31:01 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/08 17:55:53 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	;; (c != ' ' && !ft_isalnum(c) && ft_isprint(c)) -> true
	
global	ft_ispunct
extern	ft_isalnum
extern	ft_isprint
	section	.text

ft_ispunct:
	mov		rdx,	rdi
	call	ft_isalnum
	cmp		rax,	0
	jne		false
	mov		rdi,	rdx
 	add		rdi,	-33		;move the true area to a 0 start
 	cmp		rdi,	94		;cmp 'substraction' affects Carry Flag
	sbb		rax,	rax		;x - x - CF = -CF : -1 if cmp overflowed, else 0
	and		rax,	1		;& operator swap -1 into 1, and let 0 as it was :)
	ret

false:
	mov		rax,	0
	ret
