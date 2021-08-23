.text
.global histo
.type histo, "function"

// W0 - nº de notas
// X1 - vetor de notas
// X2 - vetor do histograma
histo:
    stp x29, x30, [sp, -16]!
    mov x29, sp

    fmov s0, wzr
    ucvtf s1, w0

histo_Loop:
    cmp w0, 0
    b.eq histo_Loop_End

    ldr q2, [x1], 16
    sub w0, w0, 16

    // Calcular soma
    uaddlv h3, v2.16b

    umov w9, v3.h[0]
    ucvtf s3, w9

    fadd s0, s0, s3

    // Calcular histograma
    mov w9, 0

histo_LoopInner:
    cmp w9, 20
    b.HI histo_LoopInner_End

    dup v3.16b, w9
    cmeq v3.16b, v3.16b, v2.16b

    addv b3, v3.16b

    smov w10, v3.b[0] // W10 = nº de notas iguais a W9 

    add x11, x2, w9, sxtw
    ldrb w12, [x11]

    sub w12, w12, w10

    strb w12, [x11]

    add w9, w9, 1

    b histo_LoopInner

histo_LoopInner_End:
    b histo_Loop

histo_Loop_End:
    fdiv s0, s0, s1

    ldp x29, x30, [sp], 16
    ret
