default rel

section .data
pi:    dd 3.14159
three: dd 3.0

section .text
global volume                ; V=pi*r^2*h/3
volume:
    mulss   xmm0, xmm0       ; r^2
    mulss   xmm0, [pi]
    mulss   xmm0, xmm1
    divss   xmm0, [three]
 	ret
