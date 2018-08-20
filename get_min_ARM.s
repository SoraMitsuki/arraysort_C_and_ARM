@ Name: Jiaqi Fan
@ PID: A12584051
@ UserID: SoraMitsuki

@ Name: Xuanru Zhu
@ PID: A91064234
@ UserID: Aaron12138
.syntax unified

.text

.align 8
.global get_min_ARM
.func get_min_ARM, get_min_ARM
.type get_min_ARM, %function

get_min_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0)
    @-----------------------
    LDR r4, [r0, #4] @ load list->size into r4
  if:
    CMP r4, #0 @ compare size and 0
    BNE else @ not euqal jump to else
    MOV r0, #-1 @ if equals o return -1
    B end @ jump to end
  else:
    LDR r5, [r0] @ load list-> sortedlist to r5
    LDR r0, [r5] @ load the min element to r0

    @ (your code)

    @ put your return value in r0 here:    

    @-----------------------

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
  end:
    BX lr
.endfunc

.end

