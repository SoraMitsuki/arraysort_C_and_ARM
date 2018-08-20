@ Name: Jiaqi Fan
@ PID: A12584051
@ UserID: SoraMitsuki

@ Name: Xuanru Zhu
@ PID: A91064234
@ UserID: Aaron12138
.syntax unified

.text

.align 8
.global pop_min_ARM
.func pop_min_ARM, pop_min_ARM
.type pop_min_ARM, %function

pop_min_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0)
    @-----------------------
    MOV r11, #0 @this is for forloop
    ADD r10, r11, #4 @need this for loop
    MOV r9, #0 @ this is index for loop
    LDR r4, [r0, #4] @ load size
  if: 
    CMP r4, #0 @ compare size
    BNE else @ jump if not zero
    MOV r0, #-1 @ return -1 if equal zero
    B end
  else:
    LDR r5, [r0] @ load sortedlist
    LDR r6, [r5] @ load sortedlist first element into r6
  forloop:
    CMP r9, r4 @ compare index and 
    BGE extra
    LDR r7, [r5, r10] @ load the next element
    STR r7, [r5, r11] @ store the second element into the
    ADD r11, r11, #4 @ move to the next memory position
    ADD r10, r10, #4 @ move to the next memory position
    ADD r9, r9, #1 @ increase the index
    B forloop
    
    @ (your code)

    @ put your return value in r0 here:

    @-----------------------
  extra:
    SUB r4, r4, #1
    STR r4, [r0, #4]
    MOV r0, r6 @ the min value need to be poped

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
  end:
    BX lr
.endfunc

.end

