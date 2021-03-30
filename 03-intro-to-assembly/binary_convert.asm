section .text
global binary_convert
binary_convert:
    mov         rcx, 0
    mov         rax, 0              ; for total
    mov         rbx, rdi            ; copy input into rbx
start_loop:
    cmp         rdi, 0              ; no need to process if input is empty
    je          done
    movzx       ecx, byte [rbx]     ; put first byte of rdi into ecx
    shr         rbx, 8              ; lose the first byte, we only care about subsequent bytes
    shl         rax, 1              ; total * 2
    cmp         ecx, 49             ; if current byte is "1", we need to add 1 to total
    je          add_one
    jmp         start_loop
add_one:
    add         rax, 1
    jmp         start_loop
done:
    ret
