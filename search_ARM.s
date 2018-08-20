@ Name: Jiaqi Fan
@ PID: A12584051
@ UserID: SoraMitsuki

@ Name: Xuanru Zhu
@ PID: A91064234
@ UserID: Aaron12138
.syntax unified

.text

.align 8
.global search_ARM
.func search_ARM, search_ARM
.type search_ARM, %function

search_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0, int val is in r1)
    @-----------------------
    MOV r11, #0 @ this is index for loop
    LDR r10, [r0, #4] @ load the size from ls
    LDR r9, [r0] @ load the sortedlist
  forloop:
    CMP r11, r10 @ loop through the size
    BGE end
    LDR r4, [r9]
    CMP r1, r4 @ check for equality
    BLT end @ not found return -1
    CMP r1, r4
    BNE update @ update the information about index and array
    MOV r0, r11
    B veryend @ find an goes to very end
  update:
    ADD r11, r11, #1
    ADD r9, r9, #4
    B forloop
    @ (your code)

    @ put your return value in r0 here:

    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
  end:
    MOV r0, #-1
  veryend:
    BX lr
.endfunc

.end

