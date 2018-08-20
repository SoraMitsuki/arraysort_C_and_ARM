@ Name: Jiaqi Fan
@ PID: A12584051
@ UserID: SoraMitsuki

@ Name: Xuanru Zhu
@ PID: A91064234
@ UserID: AAron12138
.syntax unified

.text

.align 8
.global get_max_ARM
.func get_max_ARM, get_max_ARM
.type get_max_ARM, %function

get_max_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0)
    @-----------------------
    LDR r4, [r0, #4] @ load ls->size into r4
  if: 
    CMP r4, #0 @ compare r4 and 0
    BNE else @ jump to else if not equal
    MOV r0, #-1 @ if euquals return -1
    B end
  else:
    SUB r4, r4, #1 @ let the size -1
    LDR r5, [r0] @ load ls->sorted list
    LDR r6, [r5, r4, LSL #2] @ load (sortedlist + size -1)
    MOV r0, r6 @ return that value

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

