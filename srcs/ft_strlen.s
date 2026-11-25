section .text
global ft_strlen

; int	ft_strlen(char *str)
ft_strlen:
	mov	rax, 0		; Initialise rax register as coutner (and return value)
	
.loop
	cmp byte [rdi + rax], 0		; if (str[i] == 0)
	je	.return					; return

	inc	rax						; i++
	jmp	.loop

.return
	ret
