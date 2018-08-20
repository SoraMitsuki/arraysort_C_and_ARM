@ Name: Jiaqi Fan
@ PID: A12584051
@ UserID: SoraMitsuki
 
@ Name: Xuanru Zhu
@ PID: A91064234
@ UserID: Aaron12138
.syntax unified

.text

.align 8
.global remove_val_ARM
.func remove_val_ARM, remove_val_ARM
.type remove_val_ARM, %function

remove_val_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0, int val is in r1)
    @-----------------------
    MOV r11, #0 @ this is i
    LDR r10, [r0, #4] @ this is size
    LDR r9, [r0] @ this is list
    MOV r4, #0 @ number deleted
  forloop:
    CMP r11, r10 @ check between index and size
    BGE end @ loop end jump to end
    LDR r5, [r9, r11, LSL #2] @ load the value inside the list
  if:
    CMP r1, r5 @ compare val and the elements in list
    BEQ else @ if it is equal jump to else
    B update @ if it not continue with loop
  else:
    MOV r8, r11 @ r8 is j which is i
    SUB r7, r10, #1 @ r7 is size -1
  elsefor:
    CMP r8, r7 @ loop for move element 1 forward
    BGE elsenext 
    ADD r6, r8, #1 @ temp variable
    LDR r5, [r9, r6, LSL #2] @ load the element 
    STR r5, [r9, r8, LSL #2] @ store to the previous position
    ADD r8, r8, #1
    B elsefor
  elsenext:
    SUB r10, r10, #1 @ size decrease
    ADD r4, r4, #1 @ number of remove increase
    SUB r11, r11, #1 @ index decrease
  update:
    ADD r11, r11, #1
    B forloop
  end:
    STR r10, [r0, #4] @ store new size back to ls
    MOV r0, r4 @ return the number of deleted

    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

