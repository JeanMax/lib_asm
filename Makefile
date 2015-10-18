#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mcanal <mcanal@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/09/09 21:26:32 by mcanal            #+#    #+#              #
#    Updated: 2015/10/15 18:44:23 by mcanal           ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = libfts.a
TEST = test
I_DIR = -I inc/
AR = ar rc
RM = rm -rf
MKDIR = mkdir -p
O_DIR = obj
VPATH = src
CFLAGS = -Wall -Werror -O2
SRC_TEST = main.c
SRC =	ft_bzero.s		ft_isalpha.s	ft_isprint.s	ft_puts.s		\
		ft_strlen.s		ft_cat.s		ft_isascii.s	ft_memcpy.s		\
		ft_strcat.s		ft_tolower.s	ft_isalnum.s	ft_isdigit.s	\
		ft_memset.s		ft_strdup.s		ft_toupper.s	ft_islower.s	\
		ft_isupper.s	ft_isblank.s	ft_iscntrl.s	ft_isgraph.s	\
		ft_ispunct.s	ft_isxdigit.s	ft_putstr.s		ft_putstr_fd.s	\
		ft_strclr.s		ft_strcpy.s		ft_strncpy.s
SRCC =	$(SRC:%.s=src/%.s)
OBJS =	$(SRC:%.s=$(O_DIR)/%.o)
DEPS =  $(OBJS:%.o=%.d)

ifeq ($(shell uname), Linux)
CC = clang-3.5 -ggdb -fsanitize=address,undefined
ASM = nasm -O2 -f elf64 -gv -p
else
CC = clang -g
ASM = ~/.brew/bin/nasm -O2 -f macho64 -g --prefix _
endif

WHITE = \033[37;01m
RED = \033[31;01m
GREEN =  \033[32;01m
YELLOW =  \033[33;01m
BLUE =  \033[34;01m
BASIC = \033[0m

.SILENT:
.PHONY: all test clean fclean re

all:
	@$(MAKE) $(NAME)
	@$(MAKE) test

test: $(SRC_TEST)
	$(CC) $(CFLAGS) $(I_DIR) $< $(NAME) -o $(TEST)
	@echo "$(WHITE)$< $(NAME) ->$(RED) $(TEST)$(BASIC)"
	@echo "$(GREEN)crazy $(YELLOW)test $(RED)made!$(BASIC)"

-include $(DEPS)

$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)
	@echo "$(BLUE)$(OBJS) $(WHITE)->$(RED) $@$(BASIC)"
	ranlib $(NAME)
	@echo "$(WHITE)ranlib $(RED)$@"
	@echo "$(WHITE)flags:$(BASIC) $(CFLAGS)"
	@echo "$(WHITE)compi:$(BASIC) $(CC)"

$(O_DIR)/%.o: %.s
	@echo "$(WHITE)$<\t->$(BLUE) $@ $(BASIC)"
	$(ASM) $(CFLAGS) $(I_DIR) $< -o $@ -MD $(@:%.o=%.d)

$(OBJS): | $(O_DIR)

$(O_DIR):
	$(MKDIR) $(O_DIR)

clean:
	$(RM) $(O_DIR)

fclean: clean
	$(RM) $(NAME)
	$(RM) test

re: fclean all
