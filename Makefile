NAME			= libasm.a
SRC				= srcs/ft_strlen.s \
				  srcs/ft_strcpy.s \
				  srcs/ft_strcmp.s \
				  srcs/ft_write.s \
				  srcs/ft_read.s \
				  srcs/ft_strdup.s \
				  srcs/ft_calloc.s

SRC_BONUS		= bonus/ft_atoi_base_bonus.s

O_FILES			= $(SRC:%.s=%.o)
O_FILES_BONUS	= $(O_FILES) $(SRC_BONUS:%.s:%.o)

all: $(NAME)

$(NAME): $(O_FILES)
	ar rcs $@ $(O_FILES)

%.o: %.s
	nasm -f elf64 $< -o $@

clean:
	rm -rf $(O_FILES)

fclean: clean
	rm -rf $(NAME)

re: fclean all

bonus: $(O_FILES_BONUS) $(O_FILES)
	ar rcs $(NAME) $(O_FILES) $(O_FILES_BONUS)

test: all
	gcc tests/test.c $(NAME)
	./a.out

test_bonus: all
	gcc tests/test.c $(NAME) -DBONUS=1
	./a.out

.PHONY: all clean fclean bonus re test_bonus test