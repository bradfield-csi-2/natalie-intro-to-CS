section .text
global pangram
pangram:
    mov         rax, 0              ; zeroing out the output reg
    mov         r8, 0               ; zeroing out the temp reg - we're going to store an 'array' of seen chars in it

loopstart:
    movzx       rcx, byte [rdi]     ; put first byte of rdi into ecx
    cmp         rcx, 0              ; no need to process if input is empty
    je          end
    sub         rcx, 0x41           ; char - 'A'
    and         rcx, 11111b         ; mask the low 5 bits for case insensitivity
    bts         r8, rcx             ; toggle corresponding bit on
    and         r8, 0x03ffffff      ; mask off the low 26 bits of the seen array go get rid of punctuation
    inc         rdi                 ; advance the input pointer
    jmp         loopstart

end:
    cmp         r8, 0x3ffffff       ; 0x3ffffff is 11111111111111111111111111 (26)
    je          set_true
    ret

set_true:
    mov         rax, 1
    ret