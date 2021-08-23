.data
pi: .double 3.141592653

.text
.global Exercise
.type Exercise, "function"

// D0 - valor do raio
Exercise:
    fmul d0, d0, d0
    
    ldr d1, pi
    fmul d0, d0, d1
    ret
