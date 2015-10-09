# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    pousse.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mcanal <zboub@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/10/08 13:21:24 by mcanal            #+#    #+#              #
#    Updated: 2015/10/09 14:36:24 by mcanal           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

LIBFT_PATH="/home/mcanal/quarantedeux/libft"
LIBAS_PATH="/home/mcanal/quarantedeux/asm"

SRC="bzero strcat isdigit isascii isprint isalpha isalnum strlen memset memcpy strdup islower isupper isblank iscntrl isgraph ispunct isxdigit";

if [ uname="Linux" ]; then
	CLANG="clang-3.5"
	NASM="nasm -f elf64"
else
	CLANG="clang"
	NASM="nasm -f macho64"
fi;

AS="as_src";
FT="ft_src";
INC="inc";
OBJ="obj";
rm -f a.out;
rm -rf $AS;
rm -rf $FT;
rm -rf $INC;
rm -rf $OBJ;
mkdir -p $AS;
mkdir -p $FT;
mkdir -p $INC;
mkdir -p $OBJ;

find $LIBAS_PATH -name "*.h" | xargs cp --target-directory=$INC;
find $INC -name "*.h" | xargs sed -i "s/ft_/as_/g"
find $LIBFT_PATH -name "*.h" | xargs cp --target-directory=$INC;
for FILE in $SRC;
do
	find $LIBFT_PATH -name ft_$FILE.c | xargs cp --target-directory=$FT;
	$CLANG -O2 -I $INC -c $FT/ft_$FILE.c -o $OBJ/ft_$FILE.o;

	find $LIBAS_PATH -name ft_$FILE.s | xargs cp --target-directory=$AS;
	sed -i "s/ft_/as_/g" $AS/ft_$FILE.s;
	$NASM -O2 -I $INC $AS/ft_$FILE.s -o $OBJ/as_$FILE.o;
done;
ar rc libsmurf.a $OBJ/*;
ranlib libsmurf.a;
$CLANG pousse.c libsmurf.a -I $INC;
./a.out;
#rm -f a.out;
rm -f libsmurf.a;
rm -rf $AS;
rm -rf $FT;
rm -rf $INC;
rm -rf $OBJ;
