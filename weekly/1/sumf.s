.text
.global sumf
.type sumf, "function"

sumf: // x19 - x30
    stp x29, x30, [sp, -16]!
    mov x29, sp

    str x20, [sp, 16]

    mov x20, 1

    ldp x29, x30, [sp], 16
    ret

// y = x + 2
funcy:
    add x0, x0, 2
    ret


.text
.global sumf
.type sumf , %function
sumf:
    stp x29, x30,[sp, #-48]!
    mov x29, sp

    str x19, [sp, 16]
    str x20, [sp, 24]
    str x21, [sp, 32]

    mov x20, x0
    mov w21, w1

    mov x3, #0
    scvtf d2, x3//somatorio
loop:
    cbz w21, fim
    ldr d0, [x20], #8
    sub w21,w21, #1
    fcmp d0, #0.0
    b.lt funcyy
//notfuncy
    mov x2, #5
    scvtf d1, x2
    fmul d0, d0, d0 //x ao quadrado
    fadd d1, d1, d0 //5 + x * x
    fsqrt d1, d1 //sqrt(5+x*x)
    fadd d2, d2, d1
    b loop
funcyy:
    fmov x19, d2

    bl funcy

    fmov d2, x19
    fadd d2, d2, d0

    b loop
fim:
    fmov d0, d2
    
    ldr x19, [sp, 16]
    ldr x20, [sp, 24]
    ldr x21, [sp, 32]

    ldp x29, x30, [sp], #48
    ret

