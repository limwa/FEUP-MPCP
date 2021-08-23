.text
.global Exercise
.type Exercise, "function"

// D0 - valor de x1
// D1 - valor de y1
// D2 - valor de x2
// D3 - valor de y2
Exercise:
    fsub d0, d0, d2
    fsub d1, d1, d3

    fmul d0, d0, d0
    fmul d1, d1, d1

    fadd d0, d0, d1
    fsqrt d0, d0
    ret
