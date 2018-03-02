.PHONY: all clean fclean re

ASM = nasm

N_FLAGS = -f macho64 -DOSX

CC = clang

FLAGS = -Wall -Wextra -Werror

NAME = Colleen Grace Sully

all: $(NAME)

Colleen:
	@$(ASM) $(N_FLAGS) -c Colleen.c
	@$(CC) $(FLAGS) Colleen.o -o Colleen
	@echo "\033[1;34mDr_Quine\t\033[1;33mCompilation - Colleen\t\033[0;32m[OK]\033[0m"

Grace:
	@$(ASM) $(N_FLAGS) -c Grace.c
	@$(CC) $(FLAGS) Grace.o -o Grace
	@echo "\033[1;34mDr_Quine\t\033[1;33mCompilation - Grace\t\033[0;32m[OK]\033[0m"

Sully:
	@$(ASM) $(N_FLAGS) -c Sully.c
	@$(CC) $(FLAGS) Sully.o -o Sully
	@echo "\033[1;34mDr_Quine\t\033[1;33mCompilation - Sully\t\033[0;32m[OK]\033[0m"

clean:
	@rm -rf Colleen.o
	@rm -rf Grace.o
	@rm -rf Sully.o
	@echo "\033[1;34mDr_Quine\t\033[1;33mCleaning obj\t\t\033[0;32m[OK]\033[0m"

fclean: clean
	@rm -rf Colleen
	@rm -rf Grace
	@rm -rf Grace_kid.c
	@rm -rf Sully
	@rm -rf Sully_*
	@rm -rf a.out
	@rm -rf tmp
	@echo "\033[1;34mDr_Quine\t\033[1;33mCleaning all\t\t\033[0;32m[OK]\033[0m"

re: fclean all
