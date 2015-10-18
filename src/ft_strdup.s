;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2015/10/04 23:30:46 by mcanal            #+#    #+#              ;
;    Updated: 2015/10/16 15:13:45 by mcanal           ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

global ft_strdup
extern ft_strlen
extern malloc
	section .text

ft_strdup:
	push	rbp				;realign stack
	mov		rbp,	rsp
	push	rdi				;saving ptr to stack
	call	ft_strlen
	inc		rax
	push	rax				;saving len to stack
	mov		rdi,	rax
	call	malloc
	test	rax,	rax
	jz		kthxbye
	pop		rcx
	pop		rsi
	mov		rdi,	rax
	rep		movsb			;while (rcx--) *rdi++ = *rsi++

kthxbye:
	leave					;clear registers
	ret
