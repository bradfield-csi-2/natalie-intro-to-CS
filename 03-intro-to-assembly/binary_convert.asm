section .text
global binary_convert
binary_convert:
    mov         rax, 0              ; for total
start_loop:
    movzx       ecx, byte [rdi]     ; put first byte of rdi into ecx
    cmp         ecx, 0              ; no need to process if input is empty
    je          done
    inc         rdi                 ; increment the pointer to point to the next byte
    shl         rax, 1              ; total * 2
    cmp         ecx, 0x31           ; if current byte is "1", we need to add 1 to total
    je          add_one
    jmp         start_loop
add_one:
    add         rax, 1
    jmp         start_loop
done:
    ret
