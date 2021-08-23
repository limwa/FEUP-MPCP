.text
.global Exercise
.type Exercise, "function"

Exercise:
    fsqrt d0, d0
    scvtf d1, w0
    fmul d0, d0, d1
    ret
