;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_isxdigit.s                                      :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:31:01 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/08 18:04:52 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	;; 0 1 2 3 4 5 6 7 8 9 a b c d e f A B C D E F ->	true
	
global	ft_isxdigit
	section	.text

ft_isxdigit:
 	add	rdi,	-48		;move the true area to a 0 start
 	cmp	rdi,	10		;cmp 'substraction' affects Carry Flag
	sbb	rax,	rax		;x - x - CF = -CF : -1 if cmp overflowed, else 0
	cmp	rax,	0
	jne	kthxbye

 	add	rdi,	-17		;move the true area to a 0 start
 	cmp	rdi,	6		;cmp 'substraction' affects Carry Flag
	sbb	rax,	rax		;x - x - CF = -CF : -1 if cmp overflowed, else 0
	cmp	rax,	0
	jne	kthxbye

 	add	rdi,	-32		;move the true area to a 0 start
 	cmp	rdi,	6		;cmp 'substraction' affects Carry Flag
	sbb	rax,	rax		;x - x - CF = -CF : -1 if cmp overflowed, else 0

kthxbye:
	and	rax,	1		;& operator swap -1 into 1, and let 0 as it was :)
	ret
	
