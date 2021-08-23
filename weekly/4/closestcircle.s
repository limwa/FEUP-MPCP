.data
plus_infty: .quad 0x7FF0000000000000

.text
.global closestCircle
.type closestCircle, "function"

// W0 - número de pontos
// X1 - vetor de pontos ([x1, y1, x2, y2, ...]) [float]
// W2 - número de círculos
// X3 - vetor de círculos ([x1, y1, r1, x2, y2, r2, ...]) [double]
// X4 - vetor para os resultados (índices dos círculos mais próximos a cada ponto) [int]
// Devolve: void
closestCircle:
    stp x29, x30, [sp, -96]!
    mov x29, sp

    str x19, [sp, 16] // número de pontos
    str x20, [sp, 24] // vetor de pontos ([x1, y1, x2, y2, ...]) [float]
    str x21, [sp, 32] // número de círculos
    str x22, [sp, 40] // vetor de círculos ([x1, y1, r1, x2, y2, r2, ...]) [double]
    str x23, [sp, 48] // vetor para os resultados (índices dos círculos mais próximos a cada ponto) [int]
    str x24, [sp, 56]
    str x25, [sp, 64]
    str x26, [sp, 72]
    str d8, [sp, 80]

    mov w19, w0
    mov x20, x1
    mov w21, w2
    mov x22, x3
    mov x23, x4

    mov w24, 0 // contador dos pontos

closestCircle_Loop1:
    cmp w24, w19
    b.HS closestCircle_EndLoop1

    mov x25, x22 // endereço do vetor de círculos
    ldr d8, plus_infty

    mov w26, 0

closestCircle_Loop2:
    cmp w26, w21
    b.HS closestCircle_EndLoop2

    // Carregar o ponto
    ldr s0, [x20]
    ldr s1, [x20, 4]

    // Carregar círculo
    ldr d2, [x25], 8
    ldr d3, [x25], 8
    ldr d4, [x25], 8

    bl distance

    fcmp d0, d8
    b.GT closestCircle_Loop2_AfterUpdate

    fcmp d0, 0.0
    b.LS closestCircle_Loop2_AfterUpdate

    fmov d8, d0
    str w26, [x23]

closestCircle_Loop2_AfterUpdate:
    add w26, w26, 1
    b closestCircle_Loop2

closestCircle_EndLoop2:
    add x20, x20, 8 // Select next point
    add x23, x23, 4 // Update result location
    add w24, w24, 1

    b closestCircle_Loop1

closestCircle_EndLoop1:
    ldr x19, [sp, 16]
    ldr x20, [sp, 24]
    ldr x21, [sp, 32]
    ldr x22, [sp, 40]
    ldr x23, [sp, 48]
    ldr x24, [sp, 56]
    ldr x25, [sp, 64]
    ldr x26, [sp, 72]
    ldr d8, [sp, 80]

    ldp x29, x30, [sp], 96
    ret

// S0 - abcissa de um ponto
// S1 - ordenada de um ponto
// D2 - abcissa do centro de um círculo
// D3 - ordenada do centro de um círculo
// D4 - raio de um círculo
// Devolve: distância do ponto ao círculo
distance:
    fcvt d0, s0
    fcvt d1, s1

    fsub d0, d0, d2
    fmul d0, d0, d0

    fsub d1, d1, d3
    fmul d1, d1, d1

    fadd d0, d0, d1
    fsqrt d0, d0

    fsub d0, d0, d4
    ret
