@ Name: Jiaqi Fan
@ PID: A12584051
@ UserID: SoraMitsuki

@ Name: Xuanru Zhu
@ PID: A91064234
@ UserID: Aaron12138


.syntax unified

.text

.align 8
.global insert_ARM
.func insert_ARM, insert_ARM
.type insert_ARM, %function

insert_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (list *ls is in r0, int val in r1)
    @-----------------------
  CMP r0, #0 @ null check for list
    BEQ nullend
  beginning:
    LDR r11, [r0] @ load sorted list into r11
    LDR r4, [r0, #4] @ load the list size
    LDR r5, [r0, #8] @ load the max size
  CMP r4, #0
  BEQ emptyInsert
    CMP r4, r5 @ compare size and max size
    BNE next @ jump to continue if is not equal
  LSL r5, r5, #1 @ double the max size
  STR r5, [r0, #8] @ store the doubled max size
  MOV r8, r1 @ save r0, r1 into temp
  MOV r10, r0
  MOV r0, r11 @ move the sorted list into r0 
  MOV r1, r5, LSL #2 @ this is the new size
  BL realloc @ call realloc
  CMP r0, #0 @ null check
  BEQ nullend
  STR r0, [r10] @ store the new array into temp
  MOV r11, r0 @ move temp back to original
  MOV r0, r10
  MOV r1, r8
  B beginning @ repeat for check again
  emptyInsert:
    CMP r4, #0 @ check the size if 0 or not
    BNE next
    STR r1, [r11] @ if the list is empty just insert in the frst place
    ADD r4, r4, #1 @ increase the size
    STR r4, [r0, #4] @ update the size
    MOV r0, #0 @ move #0 into r0
    B end
  next:
    MOV r10, #0 @ create index as 0
  loop1:
    CMP r10, r4 @ compare index and size
    BGE loop2 @ is index is greater or equal to size branch
    LDR r6, [r11, r10, LSL #2] @ load the value inside the list
    CMP r1, r6 @ compare val and r6
    BLT loop2
    ADD r10, r10, #1 @ increase the index
    B loop1
  loop2:
    SUB r9, r4, #1 @ this is size -1
  mainloop:
    CMP r9, r10 @ compare size -1 and index r10
    BLT insert
    ADD r8, r9, #1 @ this is regular size
    LDR r7, [r11, r9, LSL #2] @ load from list in i position
    STR r7, [r11, r8, LSL #2] @ store into list in i + 1 position
    SUB r9, r9, #1 @ i--
    B mainloop
  insert:
    STR r1, [r11, r10, LSL #2] @ store the val into index position
    ADD r4, r4, #1 @ increase size
    STR r4, [r0, #4] @ store the new size
    MOV r0, r10 @ return the index
    B end
  nullend:
    MOV r0, #-1 @ return -1
  end:
    @ restore caller's registers
    pop {r4-r11, ip, lr}

    @ ARM equivalent of return
    BX lr
.endfunc

.end

