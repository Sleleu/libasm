NAME = libasm.a

SRCS =	ft_strlen.s \
		ft_strcpy.s \
		ft_strcmp.s \
		ft_write.s  \
		ft_read.s   \
		ft_strdup.s

OBJS = $(SRCS:.s=.o)

CC = nasm -f elf64

LIB = ar rcs $(NAME) $(OBJS)

all: $(NAME)

$(NAME): $(OBJS)
		$(LIB)

%.o: %.s
		$(CC) -o $@ $?

clean: 
		rm -rf $(OBJS)

fclean: clean
		rm -rf $(NAME)

re: fclean all

.PHONY: all clean fclean re