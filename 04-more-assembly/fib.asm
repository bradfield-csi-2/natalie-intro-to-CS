section .text
global fib
fib:
    mov         rax, rdi        ; For the base case just return n
    cmp         rax, 1
    jle         done

    push        rbp             ; Save old frame pointer
    push        rbx             ; Save callee save register rbx
    sub         rsp, 8          ; Allocate memory on the stack

    mov         rbx, rdi        ; Store n in rbx

    lea         rdi,  [rdi-1]   ; Put n - 1 into rdi for the fib call
    call        fib
    mov         rbp, rax        ; Store the result of fib(n-1) in rbp

    lea         rdi, [rbx-2]    ; Put n - 2 into rdi for the next fib call
    call        fib

    add         rax, rbp

    add         rsp, 8          ; Deallocate memory on the stack
    pop         rbx             ; Clean up callee save register rbx
    pop         rbp             ; Reset frame pointer
    ret

done:
    ret
