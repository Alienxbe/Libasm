# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marykman <marykman@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2026/11/25 17:27:02 by marykman          #+#    #+#              #
#    Updated: 2026/11/25 18:05:16 by marykman         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# -----------------------------------Colors------------------------------------

RED					:=	[38;5;9m
GREEN				:=	[38;5;10m
BLUE				:= 	[38;5;14m
YELLOW				:=	[38;5;226m
RESET				:=	[38;5;7m
PREFIX				=	[${YELLOW}${NAME}${RESET}]\t\t

# ---------------------------------Compilation---------------------------------

AS					:=	nasm
ASFLAGS				:=	-f elf64
AR					:=	ar
ARFLAGS				:=	rcs

# --------------------------------Source files---------------------------------

NAME				:=	libasm.a

FILES				:=	ft_strlen.s
SRCS				:=	$(addprefix srcs/, ${FILES})
OBJS				:=	$(patsubst srcs%.s, objs%.o, ${SRCS})

# -----------------------------------Rules-------------------------------------

all:	${NAME}

objs/%.o:	srcs/%.s
	$(AS) $(ASFLAGS) $< -o $@
	@echo "${PREFIX}Compilation of $<..."

$(NAME): $(OBJS)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS)
	@echo "${PREFIX}${NAME} created!"

clean:
	@rm -f ${OBJS}
	@echo "${PREFIX}${BLUE}Cleaning object files...${RESET}"

fclean:
	@rm -f ${NAME} ${OBJS}
	@echo "${PREFIX}${RED}Full clean.${RESET}"

re:		fclean all

# -----------------------------------.PHONY------------------------------------

.PHONY:	all clean fclean re
