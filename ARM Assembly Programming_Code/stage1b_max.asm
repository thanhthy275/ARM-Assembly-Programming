; function stage1b_max
; returns the maximum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1b_max:

        cmp r0, r1; compare values in register r0 and r1
        blt set_max1; if r0 < r1, go to set_max1
                      ; if r0 > r1; continue go to compare2

compare2:
        cmp r0,r2; compare values in register r0 and r2
        blt set_max2; if r0 < r2, go to set_max2
                    ; if r0 > r2; continue go to final2
final2:
        bx lr   ;end

set_max1:
        mov r0, r1; mov value in r1 into r0
        b compare2; continue compare2

set_max2:
        mov r0, r2  ; mov value in r2 into r0
        b final2    ; go to final2