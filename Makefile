NAME		= libasm.a
SRC			= srcs/ft_strlen.s \
			  srcs/ft_strcpy.s \
			  srcs/ft_strcmp.s \
			  srcs/ft_write.s \
			  srcs/ft_read.s \
			  srcs/ft_strdup.s
O_FILES		= $(SRC:%.s=%.o)

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

bonus:

.PHONY: all clean fclean bonus re