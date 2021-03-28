section .text
global sum_to_n
sum_to_n:
    mov         rcx, 0
    mov         rdx, 0
    mov         rbx, 1
    cmp         rdi, 0
    je          done
    call        loop

loop:
    add         rcx, rdx
    add         rdx, rbx
    cmp         rdx, rdi
    jnbe        loop
    call        done

done:
    mov         rax, rcx
	ret
