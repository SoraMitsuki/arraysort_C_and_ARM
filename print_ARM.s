@ Name: Jiaqi Fan
@ PID: A12584051
@ UserID: SoraMitsuki

@ Name: Xuanru Zhu
@ PID: A91064234
@ UserID: Aaron12138

.syntax unified

.text

.align 8
.global print_ARM
.func print_ARM, print_ARM
.type print_ARM, %function

print_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0)
    @-----------------------
    MOV r11, #0 @ this is index for loop
    MOV r9, r0 @ store r9 into temp
    LDR r10, [r9, #4] @ get the sorted list size
  loop:
    CMP r11, r10 @ compare index and list size
    BGE end
    .data
    mystr: .asciz "%d " @ set mystr for r0
    .text
    LDR r1, [r9] @ load the sorted size
    LDR r1, [r1, r11, LSL #2] @ get the element inside the list
    LDR r0, =mystr @ load mystr into r0
    BL printf
    ADD r11, #1 @ incease the index
    B loop @ return to loop
  end:

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

