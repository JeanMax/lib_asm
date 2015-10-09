;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:30:28 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 20:15:50 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

global	ft_strlen
	section	.text

ft_strlen:
	mov	rax,	rdi				;saving ptr_start
	
loop:
	cmp	byte [rdi],	0
	je	kthxbye					; \0, we're done
	inc	rdi						;ptr_end++
	jmp	loop

kthxbye:
	sub	rax,	rdi				;returning ptr_end - ptr_start
	neg	rax
	ret
