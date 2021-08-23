.text
.global CheckABS
.type CheckABS, "function"

CheckABS:
    mov X3, 0

Test:
    cmp X1, 0
    b.LS End
    ldrsw X4, [X2]
    add X2, X2, 4
    sub X1, X1, 1
    cmp W4, 0
    cneg W4, W4, LT
    cmp W4, W0
    b.LS Test
    stur WZR, [X2, -4]
    add X3, X3, 1
    b Test

End:
    mov X0, X3
    ret
