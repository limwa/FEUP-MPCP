.text
.global mirrorSeq
.type mirrorSeq, "function"

// X0 - endereço da lista de pontos
// W1 - número de pontos
mirrorSeq:
    mov w9, 0

mirrorSeq_Loop1:
    cmp w9, w1
    b.HS mirrorSeq_Loop1_End

    ldr d0, [x0]
    rev64 v0.2s, v0.2s
    str d0, [x0], 8

    add w9, w9, 1
    b mirrorSeq_Loop1

mirrorSeq_Loop1_End:
    ret
