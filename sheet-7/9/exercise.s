.text
.global prod_complexosV
.type prod_complexosV, "function"

// X0 - endereço de Z1
// X1 - endereço de Z2
// X2 - endereço do vetor de resultados
// X3 - número de números complexos
prod_complexosV:
    mov x9, 0

prod_complexosV_Loop1:
    cmp x9, x3
    b.GE prod_complexosV_Loop1_End

    ldr d0, [x0], 8
    ldr d1, [x1], 8

    rev64 v0.2s, v0.2s
    fmul v3.2s, v0.2s, v1.2s
    faddp s3, v3.2s // Parte imaginária

    rev64 v1.2s, v1.2s
    fmul v2.2s, v0.2s, v1.2s
    
    umov w10, v2.s[0]
    fmov s4, w10
    fneg s4, s4
    fmov w10, s4
    ins v2.s[0], w10

    faddp s2, v2.2s // Parte real
    
    str s2, [x2], 4
    str s3, [x2], 4

    add x9, x9, 1
    b prod_complexosV_Loop1

prod_complexosV_Loop1_End:
    ret
