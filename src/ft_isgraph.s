;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isgraph.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:31:01 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/08 17:44:08 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	;; (c >= 33 && c <= 126) -> true
	
global	ft_isgraph
	section	.text

ft_isgraph:
	add	rdi,	-33		;move the true area to a 0 start
 	cmp	rdi,	94		;cmp 'substraction' affects Carry Flag
	sbb	rax,	rax		;x - x - CF = -CF : -1 if cmp overflowed, else 0
	and	rax,	1		;& operator swap -1 into 1, and let 0 as it was :)
	ret
