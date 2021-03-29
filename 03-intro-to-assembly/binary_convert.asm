section .text
global binary_convert
binary_convert:
    mov         rcx, 0
loop:
    cmp         rdi, 0
    je          done
    movzx       rdx, byte[rdi]
    cmp         rdx, 49
    je          shift_add_one
    jne         shift
    call        loop

shift_add_one:
    shl         rcx, 1
    add         rcx, 1
shift:
    shl         rcx, 1
done:
    mov         rax, rcx
    ret
