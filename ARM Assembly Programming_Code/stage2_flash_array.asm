; function stage2_flash_array
; flashes the contents of array given
; Arguments:
; r0 - BASE address of peripherals
; r1 - size of array
; r2 - array to flash
; Function returns nothing

stage2_flash_array:
        push{r0,r1,r2,r3,r4,r5,r6}
        mov r3, #0          ;   r3 = loop counter (index)
        lsl r4,r1,#2  ; r4=32
        mov r6, r2


        loop_stage2:
        ;Calculate address of current element by adding offset to base address
        ldr   r5, [r6, r3]      ;r5 = element at address r2 + r3  ( numarray1[i])

                ; prepare to flash answer
               mov r1,r5        ; value to flash
               mov r2,$30000  ; pause time between flashes r10
                push{lr}  ; store current lr before it is overwritten during function call
                bl FLASH   ; call the FLASH function
                pop{lr} ; restore old lr value

               mov r1,$200000 ; pause time
               push {lr}
               bl PAUSE
               pop {lr}

         add r3, r3, #4        ;i++
         cmp r3, r4            ;compare counter r3 to size of array in r1
         beq end_stage2
         b loop_stage2    ;jump to loop_stage2

        end_stage2:
        pop{r0,r1,r2,r3,r4,r5,r6}
        bx lr