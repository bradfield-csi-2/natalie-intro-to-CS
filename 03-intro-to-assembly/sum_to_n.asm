section .text
global sum_to_n
sum_to_n:
    mov         rax, 0         ; total
    mov         rcx, 0         ; counter
loop:
    add         rax, rcx
    add         rcx, 1         ; increment counter
    cmp         rcx, rdi       ; check that our counter is still <= n
    jle         loop
    jmp         end
end:
    ret
