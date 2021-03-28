section .text
global sum_to_n
sum_to_n:
    mov         rcx, 0
    mov         rdx, 0
    mov         rbx, 1

loop:
    add         rcx, rdx
    add         rdx, rbx
    cmp         rdx, rdi
    jle         loop
    call        done

done:
    mov         rax, rcx
    ret
