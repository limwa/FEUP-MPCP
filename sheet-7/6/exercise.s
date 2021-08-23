.text
.global normV
.type normV, "function"

// X0 - endereço do vetor
// X1 - número de elementos
normV:
    mov x9, 0
    fmov d0, xzr
    
normV_Loop1:
    cmp x9, x1
    b.GE normV_Loop1_End

    ldr q1, [x0]
    fmul v1.2d, v1.2d, v1.2d
    faddp d1, v1.2d

    fadd d0, d0, d1

    add x0, x0, 16
    add x9, x9, 2
    b normV_Loop1

normV_Loop1_End:
    fsqrt d0, d0
    ret
