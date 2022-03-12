.intel_syntax noprefix

.section .text
    .global add_asm 
    .global sub_asm
    .global call_rust_add
    .global sum_up_eight_arguments_asm

#
# integer arguments
#
# rdi -> 1st argument
# rsi -> 2nd argument
# rdx -> 3rd argument
# rcx -> 4th argument
# r8  -> 5th argument
# r9  -> 6th argument
#
# rax -> 1st return register
# 
# floating point arguments
# xmm0 - xmm7 -> 1st - 8th argument
#
#
#

add_asm:
    add rsi, rdi
    mov rax, rsi
    ret

sub_asm:
    sub rdi, rsi
    mov rax, rdi
    ret

sum_up_eight_arguments_asm:
    add rsi, rdi
    add rdx, rsi
    add rcx, rdx
    add r8, rcx
    add r9, r8
    # last two arguments are on the stack
    mov r10, [rsp+8] # move 7th argument into rax
    add r10, r9 # and then add the 7th value (r10) to r9 to save the result in r10
    mov rax, [rsp+16] # move 8th argument into rax
    add rax, r10 # we add the last value in rax (the return register) to our previous result in r10 
    ret

call_rust_add:
    call rust_add
    ret

get_second_integer:
    mov rax, rdi
    ret
