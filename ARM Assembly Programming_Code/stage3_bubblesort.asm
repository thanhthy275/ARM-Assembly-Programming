; function stage3_bubblesort
; sorts numarray using the sorting algorithm bubble sort
; Arguments:
; r0 - size of array
; r1 - array to flash
; r2 - BASE address of peripherals

stage3_bubblesort:
    push{r0,r1,r2,r3,r4,r5,r6,r7,r8}

        mov r8,r0 ;mov size of array to r8
next:
        mov r7, #0  ;r7=i
        mov r6, #0  ;r6=j

loop:
        add r3,r7,#1    ; r3= i+1
        cmp r3,r0       ; compare counter and length of array
        bge check_loop   ;if   r3>r0, go to check_loop

        ;Calculate address of element by adding offset to base address
        ;load first value to r4
        ldr r4, [r1, r7, lsl #2]   ;r4 = element at address r1 + r7 + #4  ( numarray1[i])
        ;load second value to r5
        ldr r5, [r1, r3, lsl #2]   ;r5 = element at address r1 + r3 + #4  ( numarray1[i+1])
        
        cmp r4,r5 ; compare first value (r4) and second value (r5)
        bgt swap  ; if r4>r5, branch to swap
        
        mov r7,r3  ; move value in r3 (i) to r7 (i+1)    ;i++
        b loop ;branch to loop

swap: ;swap the value in r5 and r4
        str r5, [r1, r7, lsl #2]
        str r4, [r1, r3, lsl #2]

        add r6,r6,#1 ; j++
        
        mov r7,r3 ; move value in r3 (i) to r7 (i+1)    ;i++
        b loop  ; branch to loop

check_loop:
        cmp r6,#0    ; compare counter and 0
        subgt r0,r0,#1   ;if j counter < length (r6<r0) then r0=r0-1 (size array - 1)
        bgt next   ;if r6>0, branch to next

        ; load value into stage 2
        mov r0,r2
        adr r2,numarray1
        mov r1,r8

        push{lr}
        bl stage2_flash_array
        pop{lr}

          ;mov the address of the sorted array to r0
          ldr r0,[r1]

end_stage3:
 pop{r0,r1,r2,r3,r4,r5,r6,r7,r8}
        bx lr


