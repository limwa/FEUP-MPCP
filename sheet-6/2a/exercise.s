.data
three: .float 3.0

.text
.global Exercise
.type Exercise, "function"

// S0 - valor de A
// S1 - valor de B
// S2 - valor de C
// S3 - valor de D
Exercise:
    fsub s4, s0, s1
    fmul s4, s4, s2

    ldr x9, =three
    ldr s6, [x9] // Or substitute these two instructions with ldr s6, three

    fadd s5, s0, s3
    fsub s5, s5, s6

    fdiv s0, s4, s5
    ret
