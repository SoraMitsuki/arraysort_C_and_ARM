@ Name: Jiaqi Fan
@ PID: A12584051
@ UserID: SoraMitsuki
 
@ Name: Xuanru Zhu
@ PID: A91064234
@ UserID: Aaron12138
.syntax unified

.text

.align 8
.global createlist_ARM
.func createlist_ARM, createlist_ARM
.type createlist_ARM, %function

createlist_ARM:
    @ Save caller's registers on the stack
    push {r4-r11, ip, lr}

    @ YOUR CODE GOES HERE (int maxElements is in r0)
    @-----------------------
    MOV r4, r0 @ store r0 into temp r4
    MOV r0, #12 @ give r0 size 12
    BL malloc @ call malloc 
    CMP r0, #0 @ check for null
    BEQ end @ if it is null return null
    MOV r5, r0 @ store r0 in temp r5
    MOV r0, r4 
    LSL r0, r0, #2
    BL malloc @ malloc the pointer inside the ls
    CMP r0, #0 @ another null check
    BEQ end
    STR r0, [r5] @ store r0 into r5
    STR r4, [r5, #8] @ store the maxsize
    MOV r6, #0
    STR r6, [r5, #4] @ initialize the size to 0
    MOV r0, r5 @ return r0 as ls
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

