;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_memset.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:30:34 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/07 19:25:13 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

global	ft_memset
	section	.text

ft_memset:
	mov		rax,	rsi		;to copy
	mov		rcx,	rdx		;counter
	mov		rdx,	rdi		;saving ptr
	rep		stosb			;while (rcx--) *rdi++ = rax
	mov		rax,	rdx		;return ptr
	ret
