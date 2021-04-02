section .text
global index
index:
	; rdi: matrix
	; rsi: rows
	; rdx: cols
	; rcx: rindex
	; r8: cindex
    mov  rbx, 0                 ; clear out rbx
    imul rcx, rdx               ; the offset = 4 * (rindex * cols + cindex)
    add  rcx, r8
    imul rcx, 4
    mov rax, [rdi + rcx]
    ret
