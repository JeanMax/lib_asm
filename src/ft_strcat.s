;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcat.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:29:10 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 21:29:21 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

global	ft_strcat
	section	.text

ft_strcat:	
	mov	rax,	rdi				;saving dest
	
loop1:							;skipping dest begin
	cmp	byte [rdi],	0
	je	loop2					; \0, we're done
	inc	rdi						;dest++
	jmp	loop1

loop2:							;copy dest to src
	cmp	byte [rsi],	0
	movsb						;*rdi++ = *rsi++
	je	kthxbye					; \0, we're done
	jmp	loop2
	
kthxbye:
	ret
