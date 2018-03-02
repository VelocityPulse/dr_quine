.PHONY: all clean fclean re

ASM = nasm

N_FLAGS = -f macho64 -DOSX

LD = ld

LD_FLAGS = -macosx_version_min 10.8 -lSystem

CC = clang

FLAGS = -Wall -Wextra -Werror

NAME = Colleen Grace Sully

all: $(NAME)

Colleen:
	@$(ASM) $(N_FLAGS) Colleen.s
	@$(LD) Colleen.o $(LD_FLAGS) -o Colleen
	@echo "\033[1;34mDr_Quine\t\033[1;33mCompilation - Colleen\t\033[0;32m[OK]\033[0m"

Grace:
	@$(ASM) $(N_FLAGS) Grace.s
	@$(LD) Grace.o $(LD_FLAGS) -o Grace
	@echo "\033[1;34mDr_Quine\t\033[1;33mCompilation - Grace\t\033[0;32m[OK]\033[0m"

Sully:
	@$(ASM) $(N_FLAGS) Sully.s
	@$(LD) Sully.o $(LD_FLAGS) -o Sully
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
