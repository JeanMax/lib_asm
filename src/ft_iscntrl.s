;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_iscntrl.s                                       :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:29:41 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/08 17:42:37 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

	;; (c < 32 || c == 127) -> true

global	ft_iscntrl
	section	.text

ft_iscntrl:
	cmp	rdi,	127
	je	true
 	cmp	rdi,	32		;cmp 'substraction' affects Carry Flag
	sbb	rax,	rax		;x - x - CF = -CF : -1 if cmp overflowed, else 0
	and	rax,	1		;& operator swap -1 into 1, and let 0 as it was :)
	ret

true:
	mov	rax,	1
	ret
