# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cchameyr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/27 14:12:08 by cchameyr          #+#    #+#              #
#    Updated: 2018/02/27 14:21:34 by cchameyr         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME_COLLEEN =	Colleen

FILES_COLLEEN = Colleen.c

SRCS_COLLEEN =			$(addprefix srcs_colleen/, $(FILES_COLLEEN))

OBJS_COLLEEN =			$(addprefix objs/, $(FILES_COLLEEN:.c=.o))

NAME_GRACE =	Grace

FILES_GRACE = Grace.c

SRCS_GRACE =			$(addprefix srcs_grace/, $(FILES_GRACE))

OBJS_GRACE =			$(addprefix objs/, $(FILES_GRACE:.c=.o))

NAME_SULLY =	Sully

FILES_SULLY = Sully_5.c

SRCS_SULLY =			$(addprefix srcs_sully/, $(FILES_SULLY))

OBJS_SULLY =			$(addprefix objs/, $(FILES_SULLY:.c=.o))

FLAGS =			-Wall -Werror -Wextra

RM =			rm -rf

CC =			gcc

all: $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY)

$(NAME): $(LIBFT) $(OBJS)
	$(CC) $(FLAGS) $(OBJS) $(LIBFT) -o $(NAME)

$(OBJS):
	$(CC) $(FLAGS) -c $(SRCS)
	@make objs_mv

objs_mv:
	@mkdir objs
	@mv $(FILES:.c=.o) ./objs

objs_rm:
	@$(RM) objs
	@$(RM) $(FILES:.c=.o)

$(LIBFT):
	make -C ./libft

clean: objs_rm
	make clean -C ./libft

fclean: clean
	$(RM) $(LIBFT) $(NAME)

re: fclean all

r: objs_rm
	$(RM) $(NAME)
	@make
