.text
.global Exercise
.type Exercise, "function"

Exercise:
    cmp w2, 0
    b.LS Fim

    ldrsw X8, [X0], 4
    str X8, [X1], 8

    sub X2, X2, 1
    b Exercise

Fim:
    ret