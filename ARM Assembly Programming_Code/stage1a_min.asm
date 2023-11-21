; function stage1a_min
; returns the minimum value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1a_min:
        cmp r0, r1; compare values in register r0 and r1
        bgt set_min1; if r0 > r1, go to set_min1
              ; if r0 < r1 then continue to compare r0 and r2

compare1:
        cmp r0,r2; compare values in register r0 and r2
        bgt set_min2; if r0 > r2, go to set_min2
                    ; if r0 < r2; continue go to final
final:
        bx lr     ;end

set_min1:
        mov r0, r1  ; mov value in r1 into r0
        b compare1  ;then continue to compare r0 (r1) and r2

set_min2:
        mov r0, r2   ; mov value in r2 into r0
        b final

