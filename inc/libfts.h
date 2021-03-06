/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_libfts.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mcanal <mcanal@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2014/11/29 13:23:15 by mcanal            #+#    #+#             */
/*   Updated: 2015/10/09 14:38:01 by mcanal           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_LIBFTS_H

/*
** define
*/
# define FT_LIBFTS_H

/*
** 
*/
# include <string.h>
# include <stdlib.h>

/*
** prototype
*/
void	ft_bzero(void *s, size_t n);
char	*ft_strcat(char *dest, const char *src);
int		ft_isdigit(int c);
int		ft_isascii(int c);
int		ft_isprint(int c);
int		ft_isalpha(int c);
int		ft_isalnum(int c);
int		ft_tolower(int c); 
int		ft_toupper(int c);
int		ft_puts(const char *s);
size_t	ft_strlen(const char *s);
void	*ft_memset(void *s, int c, size_t n);
void	*ft_memcpy(void *dest, const void *src, size_t n);
char	*ft_strdup(char *src);
void	ft_cat(int fd);


/*
** bonus 
*/
int		ft_islower(int c);
int		ft_isupper(int c);
int     ft_isblank(int c);
int     ft_iscntrl(int c);
int     ft_isgraph(int c);
int     ft_ispunct(int c);
int     ft_isspace(int c);
int     ft_isxdigit(int c);
int		ft_putstr(const char *s);
int		ft_putstr_fd(const char *s, int fd);
void    ft_strclr(char *s);
char    *ft_strcpy(char *dest, const char *src);
char    *ft_strncpy(char *dest, const char *src, size_t n);

#endif
