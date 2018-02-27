# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cchameyr <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/02/27 14:12:08 by cchameyr          #+#    #+#              #
#    Updated: 2018/02/27 14:59:35 by cchameyr         ###   ########.fr        #
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

$(NAME_COLLEEN): $(OBJS_COLLEEN)
	$(CC) $(FLAGS) $(OBJS_COLLEEN) -o $(NAME_COLLEEN)

$(OBJS_COLLEEN):
	$(CC) $(FLAGS) -c $(SRCS_COLLEEN)
	@make objs_mv

$(NAME_GRACE): $(OBJS_GRACE)
	$(CC) $(FLAGS) $(OBJS_GRACE) -o $(NAME_GRACE)

$(OBJS_GRACE):
	$(CC) $(FLAGS) -c $(SRCS_GRACE)

$(NAME_SULLY): $(OBJS_SULLY)
	$(CC) $(FLAGS) $(OBJS_SULLY) -o $(NAME_SULLY)

$(OBJS_SULLY):
	$(CC) $(FLAGS) -c $(SRCS_SULLY)

objs_mv:
	@mkdir objs
	@mv *.o ./objs

objs_rm:
	@$(RM) objs
	@$(RM) *.o

clean: objs_rm

fclean: clean
	$(RM) $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY)

re: fclean all

r: objs_rm
	$(RM) $(NAME_COLLEEN) $(NAME_GRACE) $(NAME_SULLY)
	@make
