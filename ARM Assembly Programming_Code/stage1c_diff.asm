; function stage1c_diff
; returns the difference between the max and min value out of three arguments passed in
; Arguments:
; r0 - first value
; r1 - second value
; r2 - third value
; Returns result in r0 register

stage1c_diff:
       push{lr}
       bl stage1a_min    ;load min value from stage1a_min
       mov r1,r0

       push{r1}
       mov r0,r5
       mov r1,r6
       mov r2,r7

       bl stage1b_max    ;load max value from stage1a_min
       pop{r1}

       sub r0,r0,r1    ; subtract min from max to find difference
       pop{lr}

       bx lr




        

