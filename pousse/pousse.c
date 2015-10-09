/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pousse.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mcanal <zboub@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/10/08 14:12:23 by mcanal            #+#    #+#             */
/*   Updated: 2015/10/08 18:09:07 by mcanal           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include "libfts.h"
#include <stdio.h>
#include <sys/time.h>
#include <string.h>
#include <ctype.h>

static void		print_time(long *t, int total)
{
	static double std = 0, ft = 0, as = 0;

	if (total)
	{
		printf("total:\nstd: %f\nft:  %f\nas:  %f\n", std, ft, as);
		return ;
	}
		
	std += (double)t[0] / 1000000;
	ft += (double)t[1] / 1000000;
	as += (double)t[2] / 1000000;
	printf("std: %f\n", (double)t[0] / 1000000);
	printf("ft:  %f\n", (double)t[1] / 1000000);
	printf("as:  %f\n\n", (double)t[2] / 1000000);
}

static void		test_is(int (*std)(int), int(*ft)(int), int(*as)(int))
{
	int	i, j;
	long t[3];
    struct timeval  tick, tack;

	gettimeofday(&tick, NULL);
	i = 0;
	j = 0;
	std(i);
	gettimeofday(&tack, NULL);
	t[0] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	gettimeofday(&tick, NULL);
	for (j = 0; j < 100000; j++)
		for (i = -1; i <= 255; i++)
			std(i);
	gettimeofday(&tack, NULL);
	t[0] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	gettimeofday(&tick, NULL);
	for (j = 0; j < 100000; j++)
		for (i = -1; i <= 255; i++)
			ft(i);
	gettimeofday(&tack, NULL);
	t[1] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	gettimeofday(&tick, NULL);
	for (j = 0; j < 100000; j++)
		for (i = -1; i <= 255; i++)
			as(i);
	gettimeofday(&tack, NULL);
	t[2] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	print_time(t, 0);
}

void			test_memset()
{
	long t[3];
    struct timeval  tick, tack;
	char	s[200];
	int i;


	gettimeofday(&tick, NULL);
	memset(s, '0', 200);
	i = 0;
	gettimeofday(&tack, NULL);
	t[0] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	gettimeofday(&tick, NULL);
	for (i = 0; i <= 10000000; i++)
		memset(s, 'z', 200);
	gettimeofday(&tack, NULL);
	t[0] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	gettimeofday(&tick, NULL);
	for (i = 0; i <= 10000000; i++)
		ft_memset(s, 'y', 200);
	gettimeofday(&tack, NULL);
	t[1] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	gettimeofday(&tick, NULL);
	for (i = 0; i <= 10000000; i++)
		as_memset(s, 'x', 200);
	gettimeofday(&tack, NULL);
	t[2] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	print_time(t, 0);
}

void			test_bzero()
{
	long t[3];
    struct timeval  tick, tack;
	char	s[200];
	int i;


	gettimeofday(&tick, NULL);
	bzero(s, 2);
	i = 0;
	gettimeofday(&tack, NULL);
	t[0] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	gettimeofday(&tick, NULL);
	for (i = 0; i <= 10000000; i++)
		bzero(s, 200);
	gettimeofday(&tack, NULL);
	t[0] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	gettimeofday(&tick, NULL);
	for (i = 0; i <= 10000000; i++)
		ft_bzero(s, 200);
	gettimeofday(&tack, NULL);
	t[1] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	gettimeofday(&tick, NULL);
	for (i = 0; i <= 10000000; i++)
		as_bzero(s, 200);
	gettimeofday(&tack, NULL);
	t[2] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	print_time(t, 0);
}

void			test_strlen()
{
	long t[3];
    struct timeval  tick, tack;
	char	s[] = "eeeeeeeeeeeeeeeeeeeeslkfslemkfeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeemflskslfkeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee";
	int i;
	size_t useless;

	gettimeofday(&tick, NULL);
	useless = strlen(s);
	i = 0;
	gettimeofday(&tack, NULL);
	t[0] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	gettimeofday(&tick, NULL);
	for (i = 0; useless && i <= 1000000; i++)
		useless = strlen(s);
	gettimeofday(&tack, NULL);
	t[0] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	gettimeofday(&tick, NULL);
	for (i = 0; useless && i <= 1000000; i++)
		useless = ft_strlen(s);
	gettimeofday(&tack, NULL);
	t[1] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	gettimeofday(&tick, NULL);
	for (i = 0; useless && i <= 1000000; i++)
		useless = as_strlen(s);
	gettimeofday(&tack, NULL);
	t[2] = (tack.tv_sec - tick.tv_sec) * 1000000 + tack.tv_usec - tick.tv_usec;

	print_time(t, 0);
}

int				main(void)
{
	printf("Testing isdigit...\n");
	test_is(isdigit, ft_isdigit, as_isdigit);

	printf("Testing isascii...\n");
	test_is(isascii, ft_isascii, as_isascii);

	printf("Testing isprint...\n");
	test_is(isprint, ft_isprint, as_isprint);

	printf("Testing isalpha...\n");
	test_is(isalpha, ft_isalpha, as_isalpha);

	printf("Testing isalnum...\n");
	test_is(isalnum, ft_isalnum, as_isalnum);

	printf("Testing islower...\n");
	test_is(islower, ft_islower, as_islower);

	printf("Testing isupper...\n");
	test_is(isupper, ft_isupper, as_isupper);

	printf("Testing isblank...\n");
	test_is(isblank, ft_isblank, as_isblank);

	printf("Testing iscntrl...\n");
	test_is(iscntrl, ft_iscntrl, as_iscntrl);

	printf("Testing isgraph...\n");
	test_is(isgraph, ft_isgraph, as_isgraph);

	printf("Testing ispunct...\n");
	test_is(ispunct, ft_ispunct, as_ispunct);

	printf("Testing isxdigit...\n");
	test_is(isxdigit, ft_isxdigit, as_isxdigit);

	printf("Testing memset...\n");
	test_memset();

	printf("Testing bzero...\n");
	test_bzero();

	printf("Testing strlen...\n");
	test_strlen();

	print_time(NULL, 1);
	return (0);
}
